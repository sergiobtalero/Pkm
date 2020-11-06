//
//  TypeElement.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct TypeElement {
    public let slot: Int
    public let type: Species?
    
    public init(slot: Int,
                type: Species?) {
        self.slot = slot
        self.type = type
    }
}
