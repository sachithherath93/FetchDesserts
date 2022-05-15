//
//  RecipeListViewModel.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/13/22.
//

import Foundation

enum Category: String {
    // can be expanded to other categories
    case dessert = "Dessert"
    case seafood = "Seafood"
}

// View Model for a list view controller
class RecipeListViewModel {
    var category: Category
    var mealList: [MealItem] = []
    var error: MealError?
    
    init(category: Category) {
        self.category = category
    }
}

extension RecipeListViewModel {
    func fetchMealList(onCompletion: @escaping ((MealError?) -> Void)) {
        NetworkManager().executeMealListRequest(category: category.rawValue) { [weak self] meals, error in
            guard let self = self else { return }
            guard let meals = meals, error == nil else {
                onCompletion(error)
                return
            }
            self.mealList = meals
            onCompletion(nil)
        }
    }
}
