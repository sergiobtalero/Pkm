//
//  PkmListViewBuilder.swift
//  Pokedex
//
//  Created by Sergio David Bravo Talero on 5/11/20.
//

import Foundation
import UIKit

final class PkmListViewBuilder {
    private var tabTitle: String?
    private var tabImage: UIImage?
    
    func setTabTitle(_ title: String) {
        tabTitle = title
    }
    
    func setTabImage(_ image: UIImage) {
        tabImage = image
    }
    
    func build() -> PkmListViewController {
        let storyboard = UIStoryboard(name: "PkmList", bundle: nil)
        guard let pkmListVC = storyboard.instantiateInitialViewController() as? PkmListViewController else {
            fatalError("Could not allocate PkmListViewController")
        }
        
        pkmListVC.presenter = PkmListPresenter(view: pkmListVC)
        
        if let tabTitle = tabTitle, let tabImage = tabImage {
            pkmListVC.tabBarItem.title = tabTitle
            pkmListVC.tabBarItem.image = tabImage
        }
        
        return pkmListVC
    }
}
