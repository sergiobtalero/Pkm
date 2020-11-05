//
//  PkmListPresenter.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

final class PkmListPresenter {
    private weak var view: PkmListViewContract?
    
    init(view: PkmListViewContract) {
        self.view = view
    }
}

extension PkmListPresenter: PkmListPresenterContract {
    func fetchData() {
    }
}
