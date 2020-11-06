//
//  VersionGroupDetailEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

struct VersionGroupDetailEntity: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: SpeciesEntity

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}
