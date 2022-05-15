//
//  DetailsViewModel.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/13/22.
//

import Foundation
import UIKit

class DetailsViewModel {
    var mealId: String
    var meal: MealItem? {
        didSet {
            populateData()
        }
    }
    var image: UIImage?
    var instructions: String?
    var ingredientsAndMeasurements: String?
    
    init(mealId: String) {
        self.mealId = mealId
    }
    
    func populateData() {
        guard let meal = meal else { return }
        instructions = meal.strInstructions
        ingredientsAndMeasurements = getIngredientsAndMeasurements(item: meal)
        image = loadImage(item: meal)
    }
    
    func getIngredientsAndMeasurements(item: MealItem) -> String {
        let ingredients = [item.strIngredient1, item.strIngredient2, item.strIngredient3, item.strIngredient4, item.strIngredient5, item.strIngredient6, item.strIngredient7, item.strIngredient8, item.strIngredient9, item.strIngredient10, item.strIngredient11, item.strIngredient12, item.strIngredient13, item.strIngredient14, item.strIngredient15, item.strIngredient16, item.strIngredient17, item.strIngredient18, item.strIngredient19, item.strIngredient20].compactMap { $0 }.filter { !$0.isEmpty }
        let measurements = [item.strMeasure1, item.strMeasure2, item.strMeasure3, item.strMeasure4, item.strMeasure5, item.strMeasure6, item.strMeasure7, item.strMeasure8, item.strMeasure9, item.strMeasure10, item.strMeasure11, item.strMeasure12, item.strMeasure13, item.strMeasure14, item.strMeasure15, item.strMeasure16, item.strMeasure17, item.strMeasure18, item.strMeasure19, item.strMeasure20].compactMap { $0 }.filter { !$0.isEmpty }
        return combineIngredientsAndMeasurements(ingredients: ingredients, measurements: measurements)
    }
    
    func loadImage(item: MealItem) -> UIImage? {
        guard let imageString = item.strMealThumb,
              imageString != "",
              let url = URL(string: imageString),
              let data = try? Data(contentsOf: url) else {
                  // from sf symbols app
                  return UIImage(named: "person.crop.circle.badge.exclamationmark")
        }
        return UIImage(data: data)
    }
}

extension DetailsViewModel {
    func fetchRecipe(onCompletion: @escaping ((MealError?) -> Void)) {
        NetworkManager().executeMealRecipeRequest(mealId: mealId) { [weak self] meals, error in
            guard let self = self else { return }
            guard let meals = meals, let meal = meals.first, error == nil else {
                onCompletion(error)
                return
            }
            self.meal = meal
            onCompletion(nil)
        }
    }
    
    func combineIngredientsAndMeasurements(ingredients: [String], measurements: [String]) -> String {
        var ingredientIndex = 0
        var measurementIndex = 0
        var combinedString: String = ""
        
        while ingredientIndex < ingredients.count && measurementIndex < measurements.count {
            let ingMeasurePair = "\(ingredients[ingredientIndex]): \(measurements[measurementIndex])\n"
            combinedString.append(contentsOf: ingMeasurePair)
            ingredientIndex += 1
            measurementIndex += 1
        }
        
        // If ingredients are empty while measurements are not and vice versa
        while ingredientIndex < ingredients.count {
            let ingredient = "\(ingredients[ingredientIndex])\n"
            combinedString.append(contentsOf: ingredient)
            ingredientIndex += 1
        }
        
        while measurementIndex < measurements.count {
            let measurement = "\(measurements[measurementIndex])\n"
            combinedString.append(contentsOf: measurement)
            measurementIndex += 1
        }
        print(combinedString)
        return combinedString
    }
}
