//
//  StatEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct StatEntity: DataEntity {
    let baseStat, effort: Int
    let stat: SpeciesEntity

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
    
    func toDomain() throws -> Stat {
        Stat(baseStat: self.baseStat,
             effort: self.effort,
             stat: try? self.stat.toDomain())
    }
}
