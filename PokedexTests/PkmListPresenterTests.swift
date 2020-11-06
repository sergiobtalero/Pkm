//
//  PkmListPresenterTests.swift
//  PokedexTests
//
//  Created by Sergio David Bravo Talero on 6/11/20.
//

@testable import Pokedex
@testable import Data
import Domain
import XCTest

class PkmListPresenterTests: XCTestCase {
    func testFetchAndRenderDataSuccess() {
        guard let pokemon = getPokemon() else {
            XCTFail("Could not load pokemon")
            return
        }
        
        let view = PkmListViewMock()
        let usecase = GetPokemonsListUseCaseMock()
        usecase.pokemon = [pokemon, pokemon]
        let presenter = PkmListPresenter(view: view,
                                         getPokemonsListUseCase: usecase)
        
        presenter.fetchData()
        XCTAssertEqual(view.models.first!.name, "bulbasaur")
    }
    
    func testSearchPokemonFindMatchesSuccess() {
        guard let pokemon = getPokemon() else {
            XCTFail("Could not load pokemon")
            return
        }
        
        let view = PkmListViewMock()
        let usecase = GetPokemonsListUseCaseMock()
        usecase.pokemon = [pokemon, pokemon]
        let presenter = PkmListPresenter(view: view,
                                         getPokemonsListUseCase: usecase)
        presenter.fetchData()
        presenter.searchPokemon(with: "Bulb")
        XCTAssertEqual(view.models.first!.name, "bulbasaur")
    }
    
    func testSearchPokemonDidNotFindMatches() {
        guard let pokemon = getPokemon() else {
            XCTFail("Could not load pokemon")
            return
        }
        
        let view = PkmListViewMock()
        let usecase = GetPokemonsListUseCaseMock()
        usecase.pokemon = [pokemon, pokemon]
        let presenter = PkmListPresenter(view: view,
                                         getPokemonsListUseCase: usecase)
        presenter.fetchData()
        presenter.searchPokemon(with: "Char")
        XCTAssertEqual(view.models.count, 0)
    }
    
    func testDidCancelSearchSuccess() {
        guard let pokemon = getPokemon() else {
            XCTFail("Could not load pokemon")
            return
        }
        
        let view = PkmListViewMock()
        let usecase = GetPokemonsListUseCaseMock()
        usecase.pokemon = [pokemon, pokemon]
        let presenter = PkmListPresenter(view: view,
                                         getPokemonsListUseCase: usecase)
        presenter.fetchData()
        presenter.searchPokemon(with: "Bulb")
        presenter.userDidCancelSearch()
        XCTAssertEqual(view.models.first!.name, "bulbasaur")
    }
}

private extension PkmListPresenterTests {
    func getPokemon() -> Pokemon? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Bulbasaur", withExtension: "json") else {
            fatalError("Could not find bulbasaur json or load data")
        }
        let data = try! Data(contentsOf: url)
        let response = try? JSONDecoder().decode(PokemonEntity.self, from: data)
        return try? response?.toDomain()
    }
}

