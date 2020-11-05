//
//  PokedexService.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

enum PokedexService {
    case list
    case detail(id: Int)
}

extension PokedexService: ServiceContract {
    var baseURL: String {
        return "https://pokeapi.co/api/v2/pokedex"
    }
    
    var path: String? {
        switch self {
        case .list:
            return nil
        case let .detail(id):
            return "/\(id)"
        }
    }
    
    var urlRequest: URLRequest? {
        switch self {
        case .list:
            guard let url = URL(string: baseURL) else {
                return nil
            }
            return URLRequest(url: url)
        case .detail:
            guard let path = path,
                  let url = URL(string: baseURL + path) else {
                return nil
            }
            return URLRequest(url: url)
        }
    }
}
