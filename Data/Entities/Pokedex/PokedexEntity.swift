//
//  PokedexEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation
import Domain

public struct PokedexEntity: DataEntity {
    public let name: String
    public let url: String
    
    func toDomain() throws -> Pokedex {
        Pokedex(name: self.name,
                url: URL(string: self.url))
    }
}
