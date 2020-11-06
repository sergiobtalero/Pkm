//
//  Pokemon.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct Pokemon {
    public let abilities: [Ability]?
    public let baseExperience: Int
    public let forms: [Species]?
    public let height: Int
    public let id: Int
    public let isDefault: Bool
    public let locationAreaEncounters: String
    public let moves: [Move]?
    public let name: String
    public let order: Int
    public let species: Species?
    public let sprites: Sprites?
    public let stats: [Stat]?
    public let types: [TypeElement]?
    public let weight: Int
    
    public init(abilities: [Ability]?,
                baseExperience: Int,
                forms: [Species]?,
                height: Int,
                id: Int,
                isDefault: Bool,
                locationAreaEncounters: String,
                moves: [Move]?,
                name: String,
                order: Int,
                species: Species?,
                sprites: Sprites?,
                stats: [Stat]?,
                types: [TypeElement]?,
                weight: Int) {
        self.abilities = abilities
        self.baseExperience = baseExperience
        self.forms = forms
        self.height = height
        self.id = id
        self.isDefault = isDefault
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
    }

}
