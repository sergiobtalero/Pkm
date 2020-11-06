//
//  SpritesEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain

struct SpritesEntity: DataEntity {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let otherSprites: OtherSpriteEntity?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case otherSprites = "other"
    }
    
    func toDomain() throws -> Sprites {
        Sprites(backDefault: backDefault,
                backFemale: backFemale,
                backShiny: backShiny,
                backShinyFemale: backShinyFemale,
                frontDefault: frontDefault,
                frontFemale: frontFemale,
                frontShiny: frontShiny,
                frontShinyFemale: frontShinyFemale,
                otherSprite: try? self.otherSprites?.toDomain())
    }
}

// MARK: - Other
struct OtherSpriteEntity: DataEntity {
    public let dreamWorld: DreamWorldEntity
    public let officialArtwork: OfficialArtworkEntity

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case officialArtwork = "official-artwork"
    }
    
    func toDomain() throws -> OtherSprite {
        OtherSprite(dreamWorld: try? self.dreamWorld.toDomain(),
                    officialArtwork: try? self.officialArtwork.toDomain())
    }
}

// MARK: - DreamWorld
struct DreamWorldEntity: DataEntity {
    public let frontDefault: String?
    public let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
    
    func toDomain() throws -> DreamWorldSprite {
        DreamWorldSprite(frontDefault: self.frontDefault,
                         frontFemale: self.frontFemale)
    }
}

// MARK: - OfficialArtwork
struct OfficialArtworkEntity: DataEntity {
    public let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
    
    func toDomain() throws -> OfficialArtworkSprite {
        OfficialArtworkSprite(frontDefault: self.frontDefault)
    }
}
