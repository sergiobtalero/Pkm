//
//  PokemonEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct PokemonEntity: DataEntity {
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
    let sprites: SpritesEntity
    let stats: [StatEntity]
    let types: [TypeElemenEntity]
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
    
    func toDomain() throws -> Pokemon {
        Pokemon(abilities: try? self.abilities.toDomain(),
                baseExperience: self.baseExperience,
                forms: try? self.forms.toDomain(),
                height: self.height,
                id: self.id,
                isDefault: self.isDefault,
                locationAreaEncounters: self.locationAreaEncounters,
                moves: try? self.moves.toDomain(),
                name: self.name,
                order: self.order,
                species: try? self.species.toDomain(),
                sprites: try? self.sprites.toDomain(),
                stats: try? self.stats.toDomain(),
                types: try? self.types.toDomain(),
                weight: self.weight)
    }
}
