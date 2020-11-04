//
//  DomainTransformable.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation

typealias DataEntity = Codable & DomainTransformable

protocol DomainTransformable {
    associatedtype DomainModel
    func toDomain() throws -> DomainModel
}

extension Array where Element: DomainTransformable {
    func toDomain() throws -> [Element.DomainModel] {
        try map { try $0.toDomain() }
    }
}
