//
//  PokemonProviderContract.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public protocol PokemonProviderContract {
    func getPokemonList(completion: @escaping ([Pokemon]?) -> Void)
    func getPokemon(id: Int, completion: @escaping (Pokemon?) -> Void)
}
