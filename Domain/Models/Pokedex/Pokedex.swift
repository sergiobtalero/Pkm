//
//  Pokedex.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation

public struct Pokedex {
    public let name: String
    public let url: URL?
    
    public init(name: String, url: URL?) {
        self.name = name
        self.url = url
    }
}
