//
//  PokedexProviderContract.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public protocol PokedexProviderContract {
    func getPokedexList(completion: @escaping ([Pokedex]?) -> Void)
}
