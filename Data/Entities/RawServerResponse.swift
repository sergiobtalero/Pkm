//
//  RawServerResponse.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation

public struct RawServerResponse<T: Codable>: Codable {
    public let count: Int
    public let next: String?
    public let previous: String?
    public let results: [T]
}
