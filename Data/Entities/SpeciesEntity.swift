//
//  SpeciesEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct SpeciesEntity: DataEntity {
    let name: String
    let url: String
    
    func toDomain() throws -> Species {
        Species(name: self.name,
                url: self.url)
    }
}
