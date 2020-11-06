//
//  PkmListPresenter.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain
import UIKit

final class PkmListPresenter {
    private let getPokemonsListUseCase: GetPokemonsListUseCaseContract
    
    private weak var view: PkmListViewContract?
    private var pokemonList: [Pokemon] = []
    
    // MARK: - Initializer
    init(view: PkmListViewContract,
         getPokemonsListUseCase: GetPokemonsListUseCaseContract) {
        self.view = view
        self.getPokemonsListUseCase = getPokemonsListUseCase
    }
}

extension PkmListPresenter: PkmListPresenterContract {
    func fetchData() {
        getPokemonsListUseCase.execute { [weak self] pokemonList in
            self?.pokemonList = pokemonList ?? []
            let viewModels = self?.generateListViewModels(with: pokemonList ?? [])
            self?.view?.renderPokemonList(viewModels ?? [])
        }
    }
    
    func searchPokemon(with name: String) {
        let matches = pokemonList.filter { $0.name.lowercased().contains(name.lowercased()) }
        let viewModels = generateListViewModels(with: matches)
        view?.renderPokemonList(viewModels)
    }
    
    func userDidCancelSearch() {
        let viewModels = generateListViewModels(with: pokemonList)
        view?.renderPokemonList(viewModels)
    }
}

private extension PkmListPresenter {
    func generateListViewModels(with pokemon: [Pokemon]) -> [PokemonCellViewModel] {
        return pokemon.map { pkm -> PokemonCellViewModel in
            let sprites = pkm.sprites
            let imageURL = sprites?.otherSprite?.officialArtwork?.frontDefault ?? sprites?.frontDefault ?? ""
            let types = pkm.types?.compactMap { $0.type?.name.capitalized }
            return PokemonCellViewModel(imageURL: URL(string: imageURL),
                                        name: pkm.name,
                                        number: "\(pkm.id)",
                                        types: types ?? [])
        }
    }
}
