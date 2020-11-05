//
//  GetPokedexListUseCase.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

protocol GetPokedexListUseCaseContract {
    func execute(completion: @escaping ([Pokedex]?) -> Void)
}

public final class GetPokedexListUseCase {
    private let provider: PokedexProviderContract
    
    public init(provider: PokedexProviderContract) {
        self.provider = provider
    }
}

extension GetPokedexListUseCase: GetPokedexListUseCaseContract {
    func execute(completion: @escaping ([Pokedex]?) -> Void) {
        provider.getPokedexList { list in
            completion(list)
        }
    }
}
