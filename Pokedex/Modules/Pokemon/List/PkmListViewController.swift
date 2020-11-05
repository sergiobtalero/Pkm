//
//  PkmListViewController.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import UIKit

final class PkmListViewController: UIViewController {
    var presenter: PkmListPresenterContract?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
    }
}

// MARK: - PkmListViewContract
extension PkmListViewController: PkmListViewContract {}
