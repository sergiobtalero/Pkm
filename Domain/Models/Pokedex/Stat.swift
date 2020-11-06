//
//  Stat.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

public struct Stat {
    public let baseStat, effort: Int
    public let stat: Species?
    
    public init(baseStat: Int, effort: Int, stat: Species?) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}
