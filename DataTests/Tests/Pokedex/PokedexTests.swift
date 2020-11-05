//
//  PokedexTests.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

@testable import Data
import XCTest

class PokedexTests: XCTestCase {
    func testPokedexEntityParserSuccess() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Pokedex", withExtension: "json") else {
            XCTFail("Could not load json file")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(RawServerResponse<PokedexEntity>.self, from: data)
            XCTAssertEqual(response.results.first!.name, "national")
            XCTAssertEqual(response.results.first!.url, "https://pokeapi.co/api/v2/pokedex/1/")
        } catch {
            XCTFail("Could not decode PokedexEntity")
        }
        XCTAssert(true)
    }
    
    func testGetListOfPokedexesSuccess() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Retrieve list of pokedexes")
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Pokedex", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            XCTFail("Could not load data")
            return
        }
        
        // THEN
        let baseURL = "https://pokeapi.co/api/v2/pokedex"
        let urlSsession = MockURLSession(data: data, response: nil, error: nil)
        APINetworkSession(session: urlSsession, baseURL: baseURL).execute { (result: Result<RawServerResponse<PokedexEntity>?, Error>) in
            if case let (.success(response)) = result,
               let pokedexes = response?.results {
                XCTAssertEqual(pokedexes.first!.name, "national")
                XCTAssertEqual(pokedexes.first!.url, "https://pokeapi.co/api/v2/pokedex/1/")
            } else {
                XCTFail("Could not retrieve list of pokedexes")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.5)
    }
    
    func testGetListOfPokedexesFail() {
        // GIVEN
        let expectation = XCTestExpectation(description: "Error fetching pokedexes")
        let baseURL = "https://pokeapi.co/api/v2/pokedex"
        let urlSession = MockURLSession(data: nil, response: nil, error: APINetworkError.badResponse)
        
        // THEN
        APINetworkSession(session: urlSession, baseURL: baseURL).execute { (result: Result<RawServerResponse<PokedexEntity>?, Error>) in
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
