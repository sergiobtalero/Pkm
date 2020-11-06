//
//  PkmListViewController.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Domain
import UIKit

final class PkmListViewController: UIViewController {
    // MARK: - Properties and IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    private var list: [Pokemon] = []
    
    var presenter: PkmListPresenterContract?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
        setupTable()
    }
}

private extension PkmListViewController {
    func setupTable() {
        let pokemonCell = UINib(nibName: "PokemonTableViewCell", bundle: nil)
        tableView.register(pokemonCell, forCellReuseIdentifier: "PokemonTableViewCell")
        tableView.dataSource = self
        tableView.estimatedRowHeight = 75.0
    }
}

// MARK: - PkmListViewContract
extension PkmListViewController: PkmListViewContract {
    func renderPokemonList(_ list: [Pokemon]) {
        self.list = list
        tableView.reloadData()
    }
}

extension PkmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pokemon = list[indexPath.row]
        let viewModel = PokemonCellViewModel(imageURL: URL(string: pokemon.sprites?.frontDefault ?? ""),
                                             name: pokemon.name,
                                             number: "\(pokemon.id)")
        return viewModel.fill(on: tableView)
    }
}
