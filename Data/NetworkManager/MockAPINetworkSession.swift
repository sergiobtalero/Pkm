//
//  MockAPINetworkSession.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation
import Data

public class MockAPINetworkSession: ServiceContract {
    public let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    public let baseURL: String
    
    public var urlRequest: URLRequest? {
        return nil
    }
    
    public init(baseURL: String) {
        self.baseURL = baseURL
    }
}
