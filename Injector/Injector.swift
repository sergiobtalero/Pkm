//
//  Injector.swift
//  Injector
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import Domain
import Data

public final class Injector {
    public static func provideGetPokedexListUsecase() -> GetPokedexListUseCaseContract {
        return GetPokedexListUseCase(provider: providePokedexProvider())
    }
}

private extension Injector {
    static func providePokedexProvider() -> PokedexProviderContract {
        return PokedexProvider()
    }
}
