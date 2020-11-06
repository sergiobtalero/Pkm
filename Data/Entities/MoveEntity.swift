//
//  MoveEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct MoveEntity: DataEntity {
    let move: SpeciesEntity
    let versionGroupDetails: [VersionGroupDetailEntity]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    func toDomain() throws -> Move {
        Move(move: try? self.move.toDomain(),
             versionGroupDetails: try? self.versionGroupDetails.toDomain())
    }
}
