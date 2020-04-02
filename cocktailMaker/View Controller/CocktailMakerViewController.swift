//
//  CocktailMakerViewController.swift
//  cocktailMaker
//
//  Created by Claudia Contreras on 3/26/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class CocktailMakerViewController: UIViewController {
    
    // MARK: - Properties
    private let cocktailResultController = CocktailResultController()
    var cocktailResults: CocktailResults?
    var drinks: DrinksResults?
    var buttonPressed: SearchType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground3Colors(colorOne: Colors.mainBlue, colorTwo: .black, colorThree: Colors.mainBlue)
    }
    
    //MARK: - IBActions
    @IBAction func searchByNameTapped(_ sender: Any) {
        buttonPressed = .searchByName
    }
    @IBAction func searchByIngredientTapped(_ sender: Any) {
        buttonPressed = .searchByIngredient
    }
    @IBAction func listAllDrinksByLetterTapped(_ sender: Any) {
        buttonPressed = .locateByLetter
    }
    @IBAction func randomCocktailTapped(_ sender: Any) {
        buttonPressed = .random
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue", let detailVC = segue.destination as? DetailCocktailViewController {
            buttonPressed = .random
            detailVC.buttonPressed = buttonPressed
        } else if segue.identifier == "searchByNameSegue", let tableVC = segue.destination as? CocktailTableViewController {
            buttonPressed = .searchByName
            tableVC.buttonPressed = buttonPressed
        } else if segue.identifier == "listByLetterSegue", let tableVC = segue.destination as? CocktailTableViewController {
            buttonPressed = .locateByLetter
            tableVC.buttonPressed = buttonPressed
        } else if segue.identifier == "searchByIngredientSegue", let tableVC = segue.destination as? CocktailTableViewController {
            buttonPressed = .searchByIngredient
            tableVC.buttonPressed = buttonPressed
        }
    }

}
