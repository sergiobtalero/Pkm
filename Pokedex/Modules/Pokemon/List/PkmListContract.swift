//
//  PkmListContract.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation

protocol PkmListContract {
    typealias View = PkmListViewContract
    typealias Presenter = PkmListPresenterContract
}

protocol PkmListViewContract: AnyObject {}

protocol PkmListPresenterContract {
    func fetchData()
}
