//
//  Move.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct Move {
    public let move: Species?
    public let versionGroupDetails: [VersionGroupDetail]?
    
    public init(move: Species?,
                versionGroupDetails: [VersionGroupDetail]?) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }
}
