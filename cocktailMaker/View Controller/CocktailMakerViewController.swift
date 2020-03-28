//
//  CocktailMakerViewController.swift
//  cocktailMaker
//
//  Created by Claudia Contreras on 3/26/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class CocktailMakerViewController: UIViewController {
    // MARK: - IBOutlets
    
    // MARK: - Properties
    private let cocktailResultsController = CocktailResultController()
    private var cocktail: [CocktailResults] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground3Colors(colorOne: Colors.mainBlue, colorTwo: .black, colorThree: Colors.mainBlue)
    }


}
