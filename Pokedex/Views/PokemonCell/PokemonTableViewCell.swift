//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Kingfisher
import UIKit

struct PokemonCellViewModel {
    let imageURL: URL?
    let name: String
    let number: String
    let types: [String]
    
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
    private enum Constants {
        static let number = "No: "
    }
    @IBOutlet weak private var pokemonImage: UIImageView!
    @IBOutlet weak private var pokemonNameLabel: UILabel!
    @IBOutlet weak private var pokemonNumberLabel: UILabel!
    @IBOutlet weak var typesStackView: UIStackView!
    
    func setup(with viewModel: PokemonCellViewModel) {
        pokemonImage.kf.setImage(with: viewModel.imageURL)
        pokemonNameLabel.text = viewModel.name.capitalized
        pokemonNumberLabel.text = Constants.number + viewModel.number
        
        typesStackView.arrangedSubviews.map { typesStackView.removeArrangedSubview($0) }
        viewModel.types.forEach {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: $0)
            typesStackView.addArrangedSubview(imageView)
        }
    }
}
