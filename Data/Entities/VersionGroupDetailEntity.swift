//
//  VersionGroupDetailEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct VersionGroupDetailEntity: DataEntity {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: SpeciesEntity

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    
    func toDomain() throws -> VersionGroupDetail {
        VersionGroupDetail(levelLearnedAt: self.levelLearnedAt,
                           moveLearnMethod: try? self.moveLearnMethod.toDomain(),
                           versionGroup: try? self.versionGroup.toDomain())
    }
}
