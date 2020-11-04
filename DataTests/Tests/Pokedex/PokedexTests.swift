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
}
