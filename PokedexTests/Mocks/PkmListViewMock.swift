//
//  PkmListViewMock.swift
//  PokedexTests
//
//  Created by Sergio David Bravo Talero on 6/11/20.
//

@testable import Pokedex
import Foundation

final class PkmListViewMock: PkmListViewContract {
    var models: [PokemonCellViewModel] = []
    
    func renderPokemonList(_ models: [PokemonCellViewModel]) {
        self.models = models
    }
}
