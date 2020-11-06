//
//  GetPokemonsListUseCaseMock.swift
//  DomainTests
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

final class GetPokemonsListUseCaseMock: GetPokemonsListUseCaseContract {
    let provider: PokemonProviderContract
    
    init(provider: PokemonProviderContract) {
        self.provider = provider
    }

    func execute(completion: @escaping ([Pokemon]?) -> Void) {
        provider.getPokemonList { list in
            completion(list)
        }
    }
}
