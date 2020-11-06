//
//  StatEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

struct StatEntity: Codable {
    let baseStat, effort: Int
    let stat: SpeciesEntity

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}
