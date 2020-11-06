//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import UIKit

struct PokemonCellViewModel {
    let imageURL: URL?
    let name: String
    let number: String
    
    func fill(on tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView
                .dequeueReusableCell(withIdentifier: "PokemonTableViewCell") as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: self)
        return cell
    }
}

final class PokemonTableViewCell: UITableViewCell {
    @IBOutlet weak private var pokemonImage: UIImageView!
    @IBOutlet weak private var pokemonNameLabel: UILabel!
    @IBOutlet weak private var pokemonNumberLabel: UILabel!
   
    func setup(with viewModel: PokemonCellViewModel) {
        pokemonNameLabel.text = viewModel.name
        pokemonNumberLabel.text = viewModel.number
    }
}
