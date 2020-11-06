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
    private var searchController: UISearchController?
    
    private var viewModel = PkmListViewModel()
    var presenter: PkmListPresenterContract?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchData()
        setupTable()
        setupSearchBar()
    }
}

private extension PkmListViewController {
    func setupTable() {
        let pokemonCell = UINib(nibName: "PokemonTableViewCell", bundle: nil)
        tableView.register(pokemonCell, forCellReuseIdentifier: "PokemonTableViewCell")
        tableView.dataSource = self
        tableView.estimatedRowHeight = 75.0
    }
    
    func setupSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.delegate = self
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
    }
}

// MARK: - PkmListViewContract
extension PkmListViewController: PkmListViewContract {
    func renderPokemonList(_ models: [PokemonCellViewModel]) {
        viewModel.pokemonList = models
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension PkmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.pokemonList[indexPath.row].fill(on: tableView)
    }
}

// MARK: - UISearchResultsUpdating
extension PkmListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        presenter?.searchPokemon(with: text)
    }
}

// MARK: - UISearchControllerDelegate
extension PkmListViewController: UISearchControllerDelegate {
    func didDismissSearchController(_ searchController: UISearchController) {
        presenter?.userDidCancelSearch()
    }
}
