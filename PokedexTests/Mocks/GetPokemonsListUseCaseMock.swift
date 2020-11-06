//
//  GetPokemonsListUseCaseMock.swift
//  PokedexTests
//
//  Created by Sergio David Bravo Talero on 6/11/20.
//

import Foundation
import Domain

final class GetPokemonsListUseCaseMock: GetPokemonsListUseCaseContract {
    var pokemon: [Pokemon]?
    
    func execute(completion: @escaping ([Pokemon]?) -> Void) {
        completion(pokemon)
    }
}
