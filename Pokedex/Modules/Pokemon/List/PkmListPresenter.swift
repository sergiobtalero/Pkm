//
//  PkmListPresenter.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

final class PkmListPresenter {
    private weak var view: PkmListViewContract?
    private let getPokemonsListUseCase: GetPokemonsListUseCaseContract
    
    init(view: PkmListViewContract,
         getPokemonsListUseCase: GetPokemonsListUseCaseContract) {
        self.view = view
        self.getPokemonsListUseCase = getPokemonsListUseCase
    }
}

extension PkmListPresenter: PkmListPresenterContract {
    func fetchData() {
        getPokemonsListUseCase.execute { [weak self] pokemonList in
            self?.view?.renderPokemonList(pokemonList ?? [])
        }
    }
}
