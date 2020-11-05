//
//  PokemonServiceTests.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

@testable import Data
import XCTest

class PokemonServiceTests: XCTestCase {
    func testGetListOfPokemonSuccess() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Retrieve list of pokedexes")
        let data = getPokemonListData()
        let urlSession = MockURLSession(data: data, response: nil, error: nil)
        
        // THEN
        PokedexService.list.execute(session: urlSession) { (result: Result<RawServerResponse<RawEntity>?, Error>) in
            if case let (.success(response)) = result,
               let pokedexes = response?.results {
                XCTAssertEqual(pokedexes.first!.name, "bulbasaur")
                XCTAssertEqual(pokedexes.first!.url, "https://pokeapi.co/api/v2/pokemon/1/")
            } else {
                XCTFail("Could not retrieve list of pokedexes")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testGetListOfPokemonFail() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Error fetching pokedexes")
        let urlSession = MockURLSession(data: nil, response: nil, error: APINetworkError.badResponse)
        
        // THEN
        PokedexService.list.execute(session: urlSession) { (result: Result<RawServerResponse<RawEntity>?, Error>) in
            if case let(.failure(error)) = result,
               let err = error as? APINetworkError {
                XCTAssertEqual(err, .badResponse)
            } else {
                XCTFail("Invalid error or response")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }
}

private extension PokemonServiceTests {
    func getPokemonListData() -> Data? {
        let expectation = XCTestExpectation(description: "Retrieve list of pokemons")
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "PokemonList", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return data
    }
}
