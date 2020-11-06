//
//  PkmListViewController.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Domain
import UIKit

struct PkmListViewModel {
    var pokemonList: [PokemonCellViewModel] = []
}

final class PkmListViewController: UIViewController {
    // MARK: - Properties and IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel = PkmListViewModel()
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
    func renderPokemonList(_ models: [PokemonCellViewModel]) {
        viewModel.pokemonList.append(contentsOf: models)
        tableView.reloadData()
    }
}

extension PkmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.pokemonList[indexPath.row].fill(on: tableView)
    }
}
