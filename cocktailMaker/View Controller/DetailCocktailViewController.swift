//
//  DetailCocktailViewController.swift
//  cocktailMaker
//
//  Created by Claudia Contreras on 3/26/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class DetailCocktailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var drinkNameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var IngredientsTextView: UITextView!
    @IBOutlet var instructionsTextView: UITextView!
    
    // MARK: - Properties
    var cocktailResultController = CocktailResultController()
    var cocktailResult: CocktailResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground3Colors(colorOne: Colors.mainBlue, colorTwo: .black, colorThree: Colors.mainBlue)
        IngredientsTextView.setGradientBackground2Colors(colorOne: Colors.mainBlue, colorTwo: .black)
        instructionsTextView.setGradientBackground2Colors(colorOne: .black, colorTwo: Colors.mainBlue)
        updateViews()
    }
     
    // MARK: - Functions
    func updateViews() {
        guard let cocktail = cocktailResult else { return }
        drinkNameLabel.text = cocktail.drinkName
        getImage(with: cocktail)
        getIngredients(with: cocktail)
        instructionsTextView.text = "Instructions:\n\(cocktail.instructions)"
    }
    override func viewWillDisappear(_ animated: Bool) {
        drinkNameLabel.text = ""
        IngredientsTextView.text = ""
        instructionsTextView.text = ""
    }
    
    func getImage(with cocktail: CocktailResults) {
        let imagePath = cocktail.imageString
        cocktailResultController.downloadCocktailImage(path: imagePath ) { (result) in
            guard let imageString = try? result.get() else { return }
            let image = UIImage(data: imageString)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    func getIngredients(with cocktail: CocktailResults) {
        let mirrorCocktail = Mirror(reflecting: cocktail)
        
        var ingredientsArray: [String] = []
        for child in mirrorCocktail.children {
            guard let ingredientKey = child.label else { return }
            let ingredientValue = child.value as? String
            if ingredientKey.contains("ingredient") && ingredientValue != nil {
                ingredientsArray.append(ingredientValue!)
            }
        }
        let ingredient = ingredientsArray.compactMap{ $0 }
        
        var measurementArray: [String] = []
        for child in mirrorCocktail.children {
            guard let measurementKey = child.label else { return }
            let measurementValue = child.value as? String
            if measurementKey.contains("measurement") && measurementValue != nil {
                measurementArray.append(measurementValue!)
            }
        }
        let measurement = measurementArray.compactMap{ $0 }
        IngredientsTextView.text = "Ingredients: \n"
        for i in 0..<ingredient.count {
            IngredientsTextView.text += "- \(ingredient[i]): \(measurement[i])\n"
        }
    }

}
