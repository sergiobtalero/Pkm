//
//  PokedexProvider.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

public final class PokedexProvider {
    public init () {}
}

extension PokedexProvider: PokedexProviderContract {
    public func getPokedexList(completion: @escaping ([Pokedex]?) -> Void) {
        PokedexService.list.execute { (result: Result<RawServerResponse<PokedexEntity>?, Error>) in
            if case let .success(response) = result,
               let entities = response?.results {
                let models = entities.compactMap { try? $0.toDomain() }
                completion(models)
            } else {
                completion(nil)
            }
        }
    }
}
