//
//  AbilityEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

struct AbilityEntity: Codable {
    let ability: SpeciesEntity
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
