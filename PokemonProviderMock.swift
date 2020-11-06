//
//  PokemonProviderMock.swift
//  DomainTests
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

final class PokemonProviderMock: PokemonProviderContract {
    var pokemon: Pokemon?
    
    func getPokemonList(completion: @escaping ([Pokemon]?) -> Void) {
        if let pokemon = pokemon {
            completion([pokemon, pokemon])
        } else {
            completion(nil)
        }
    }
    
    func getPokemon(id: Int, completion: @escaping (Pokemon?) -> Void) {
        completion(pokemon)
    }
}
