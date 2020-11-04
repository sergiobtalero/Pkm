//
//  PokedexEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation

public struct PokedexEntity: Codable {
    let name: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
