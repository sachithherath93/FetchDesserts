//
//  DessertItem.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/12/22.
//

import Foundation

// compact map to get ingredients + map to get rids of empty "" values
// Individual Item
// Making each variable optional to handle null values
struct MealItem: Codable {
    var idMeal: String?
    var strMeal: String?
    var strDrinkAlternate: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    var strSource: String?
    var strImageSource: String?
    var strCreativeCommonsConfirmed: String?
    var dateModified: String?
    
    /* seemed a bit overkill, will use the given strMeal, idMeal var names
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal", name = "strMeal", drinkAlternative = "strDrinkAlternative" // etc etc
    } */
    
}

// Whole response struct
struct Meals: Codable {
    var meals: [MealItem]
}

/*
 idMeal    "52768"
 strMeal    "Apple Frangipan Tart"
 strDrinkAlternate    null
 strCategory    "Dessert"
 strArea    "British"
 strInstructions    "Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream."
 strMealThumb    "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
 strTags    "Tart,Baking,Fruity"
 strYoutube    "https://www.youtube.com/watch?v=rp8Slv4INLk"
 strIngredient1    "digestive biscuits"
 strIngredient2    "butter"
 strIngredient3    "Bramley apples"
 strIngredient4    "butter, softened"
 strIngredient5    "caster sugar"
 strIngredient6    "free-range eggs, beaten"
 strIngredient7    "ground almonds"
 strIngredient8    "almond extract"
 strIngredient9    "flaked almonds"
 strIngredient10    ""
 strIngredient11    ""
 strIngredient12    ""
 strIngredient13    ""
 strIngredient14    ""
 strIngredient15    ""
 strIngredient16    null
 strIngredient17    null
 strIngredient18    null
 strIngredient19    null
 strIngredient20    null
 strMeasure1    "175g/6oz"
 strMeasure2    "75g/3oz"
 strMeasure3    "200g/7oz"
 strMeasure4    "75g/3oz"
 strMeasure5    "75g/3oz"
 strMeasure6    "2"
 strMeasure7    "75g/3oz"
 strMeasure8    "1 tsp"
 strMeasure9    "50g/1¾oz"
 strMeasure10    ""
 strMeasure11    ""
 strMeasure12    ""
 strMeasure13    ""
 strMeasure14    ""
 strMeasure15    ""
 strMeasure16    null
 strMeasure17    null
 strMeasure18    null
 strMeasure19    null
 strMeasure20    null
 strSource    null
 strImageSource    null
 strCreativeCommonsConfirmed    null
 dateModified    null
 */
