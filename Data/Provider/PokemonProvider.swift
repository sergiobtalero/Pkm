//
//  PokemonProvider.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

public final class PokemonProvider {
    public init() {}
}

extension PokemonProvider: PokemonProviderContract {
    public func getPokemonList(completion: @escaping ([Pokemon]?) -> Void) {
        PokemonService.list.execute { [weak self] (result: Result<RawServerResponse<RawEntity>?, Error>) in
            if case let .success(response) = result,
               let entities = response?.results {
                self?.tryToGetPokemonsWith(list: entities, completion: { list in
                    completion(list)
                })
            } else {
                completion(nil)
            }
        }
    }
    
    public func getPokemon(id: Int, completion: @escaping (Pokemon?) -> Void) {
        PokemonService.detail(id: id).execute { (result: Result<PokemonEntity?, Error>) in
            if case let .success(pokemon) = result {
                completion(try? pokemon?.toDomain())
            } else {
                completion(nil)
            }
        }
    }
}

private extension PokemonProvider {
    func tryToGetPokemonsWith(list: [RawEntity], completion: @escaping ([Pokemon]?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var pokemons: [Pokemon] = []
        let ids = list.compactMap { getIDFrom(url: $0.url) }
        
        ids.forEach {
            dispatchGroup.enter()
            getPokemon(id: $0) { pokemon in
                pokemon.map { pokemons.append($0) }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .global()) {
            completion(pokemons)
        }
    }
    
    func getIDFrom(url: String) -> Int? {
        var index = url.replacingOccurrences(of: "https://pokeapi.co/api/v2/pokemon/", with: "")
        index = index.replacingOccurrences(of: "/", with: "")
        return Int(index)
    }
}
