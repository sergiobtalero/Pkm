//
//  PkmListContract.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

protocol PkmListContract {
    typealias View = PkmListViewContract
    typealias Presenter = PkmListPresenterContract
}

protocol PkmListViewContract: AnyObject {
    func renderPokemonList(_ models: [PokemonCellViewModel])
}

protocol PkmListPresenterContract {
    func fetchData()
}
