//
//  AbilityEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct AbilityEntity: DataEntity {
    let ability: SpeciesEntity
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    func toDomain() throws -> Ability {
        Ability(ability: try? self.ability.toDomain(),
                isHidden: self.isHidden,
                slot: self.slot)
    }
}
