//
//  Sprites.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct Sprites {
    public let backDefault: String?
    public let backFemale: String?
    public let backShiny: String?
    public let backShinyFemale: String?
    public let frontDefault: String?
    public let frontFemale: String?
    public let frontShiny: String?
    public let frontShinyFemale: String?
    public let otherSprite: OtherSprite?

    public init(backDefault: String?,
                backFemale: String?,
                backShiny: String?,
                backShinyFemale: String?,
                frontDefault: String?,
                frontFemale: String?,
                frontShiny: String?,
                frontShinyFemale: String?,
                otherSprite: OtherSprite?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.otherSprite = otherSprite
    }
}

public struct OtherSprite {
    public let dreamWorld: DreamWorldSprite?
    public let officialArtwork: OfficialArtworkSprite?
    
    public init(dreamWorld: DreamWorldSprite?,
                officialArtwork: OfficialArtworkSprite?) {
        self.dreamWorld = dreamWorld
        self.officialArtwork = officialArtwork
    }
}

// MARK: - DreamWorld
public struct DreamWorldSprite {
    public let frontDefault: String?
    public let frontFemale: String?
    
    public init(frontDefault: String?,
                frontFemale: String?) {
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
    }
}

// MARK: - OfficialArtwork
public struct OfficialArtworkSprite {
    public let frontDefault: String?
    
    public init(frontDefault: String?) {
        self.frontDefault = frontDefault
    }
}
