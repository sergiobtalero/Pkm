//
//  APINetworkSession.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 3/11/20.
//

import Foundation

typealias URLSessionResponse = (Data?, URLResponse?, Error?) -> Void

enum APINetworkError: Error {
    case invalidURL
    case badResponse
    case invalidData
}

@frozen
public enum Result<Success, Failure: Error> {
  case success(Success)
  case failure(Failure)
}

public protocol ServiceContract {
    var session: URLSession { get }
    var baseURL: String { get }
    var urlRequest: URLRequest? { get }
    
    func execute<T: Codable>(completion: @escaping (Result<T?, Error>) -> Void)
}

extension ServiceContract {
    public func execute<T: Codable>(completion: @escaping (Result<T?, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(APINetworkError.invalidURL))
            return
        }
        
        let task = session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completion(.failure(APINetworkError.badResponse))
                return
            }
            guard let data = data else {
                completion(.failure(APINetworkError.invalidData))
                return
            }
            let objects = try? JSONDecoder().decode(T.self, from: data)
            completion(.success(objects))
        }
        task.resume()
    }
}

public class APINetworkSession: ServiceContract {
    public let session: URLSession
    public let baseURL: String
    
    public var urlRequest: URLRequest? {
        return nil
    }
    
    public init(session: URLSession = URLSession.shared,
                baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
}
