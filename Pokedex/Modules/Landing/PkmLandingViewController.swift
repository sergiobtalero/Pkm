//
//  PkmLandingViewController.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 2/11/20.
//

import UIKit
import Data

class PkmLandingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Welcome Sergio")
        let session = APINetworkSession(baseURL: "https://pokeapi.co/api/v2/pokedex")
        session.execute { (result: Result<PokedexEntity?, Error>) in
            switch result {
            case let .success(entities):
                print(entities)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
