//
//  GetPokemonsListUseCase.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public protocol GetPokemonsListUseCaseContract {
    func execute(completion: @escaping ([Pokemon]?) -> Void)
}

public final class GetPokemonsListUseCase {
    private let provider: PokemonProviderContract
    
    public init(provider: PokemonProviderContract) {
        self.provider = provider
    }
}

extension GetPokemonsListUseCase: GetPokemonsListUseCaseContract {
    public func execute(completion: @escaping ([Pokemon]?) -> Void) {
        provider.getPokemonList { pokemonsList in
            completion(pokemonsList)
        }
    }
}
