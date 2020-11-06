//
//  VersionGroupDetail.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct VersionGroupDetail {
    public let levelLearnedAt: Int
    public let moveLearnMethod: Species?
    public let versionGroup: Species?
    
    public init(levelLearnedAt: Int,
                moveLearnMethod: Species?,
                versionGroup: Species?) {
        self.levelLearnedAt = levelLearnedAt
        self.moveLearnMethod = moveLearnMethod
        self.versionGroup = versionGroup
    }
}
