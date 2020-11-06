//
//  GetPokemonsListUseCaseTests.swift
//  DomainTests
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//
@testable import Domain
@testable import Data
import XCTest


class GetPokemonsListUseCaseTests: XCTestCase {
    func testFetchListSuccess() {
        // GIVEN
        let pokemon = getPokemonList()
        let provider = PokemonProviderMock()
        provider.pokemon = pokemon
        let useCase = GetPokemonsListUseCaseMock(provider:  provider)
        
        // THEN
        useCase.execute { list in
            guard let list = list else {
                XCTFail("Nil value")
                return
            }
            
            XCTAssertEqual(list.count, 2)
        }
    }
    
    func testFetchListEmpty() {
        // GIVEN
        let provider = PokemonProviderMock()
        let useCase = GetPokemonsListUseCaseMock(provider:  provider)
        
        // THEN
        useCase.execute { list in
            XCTAssert(list == nil)
        }
    }
}

private extension GetPokemonsListUseCaseTests {
    func getPokemonList() -> Pokemon? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Bulbasaur", withExtension: "json") else {
            fatalError("Could not find bulbasaur json or load data")
        }
        let data = try! Data(contentsOf: url)
        let response = try? JSONDecoder().decode(PokemonEntity.self, from: data)
        return try? response?.toDomain()
    }
}
