//
//  PokemonEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

struct PokemonEntity: Codable {
    let abilities: [AbilityEntity]
    let baseExperience: Int
    let forms: [SpeciesEntity]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [MoveEntity]
    let name: String
    let order: Int
    let species: SpeciesEntity
    let sprites: Sprites
    let stats: [StatEntity]
    let types: [TypeElement]
    let weight: Int

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order, species, sprites, stats, types, weight
    }
}
