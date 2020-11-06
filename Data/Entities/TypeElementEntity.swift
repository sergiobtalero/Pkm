//
//  TypeElement.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct TypeElemenEntity: DataEntity {
    let slot: Int
    let type: SpeciesEntity
    
    func toDomain() throws -> TypeElement {
        TypeElement(slot: self.slot,
                    type: try? self.type.toDomain())
    }
}
