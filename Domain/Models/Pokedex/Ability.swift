//
//  Ability.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct Ability {
    public let ability: Species?
    public let isHidden: Bool
    public let slot: Int
    
    public init(ability: Species?,
                isHidden: Bool,
                slot: Int) {
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}
