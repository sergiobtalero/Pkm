//
//  MoveEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

struct MoveEntity: Codable {
    let move: SpeciesEntity
    let versionGroupDetails: [VersionGroupDetailEntity]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}
