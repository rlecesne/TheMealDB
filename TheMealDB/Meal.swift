//
//  Meal.swift
//  TheMealDB
//
//  Created by Rachel Lecesne on 11/12/23.
//

import Foundation

/// List of meals --helps with decoding
struct Category: Decodable {
    let meals:[Meal]
}

/// Meal
///
/// title: name of meal
/// thumbnail: url for image of meal
/// id: Unique string ID of meal
struct Meal: Codable {
    let title: String
    let thumbnail: URL
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case title = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}

/// List of recipes --helps with decoding
struct RecipeCategory: Decodable {
    let meals: [Recipe]
}

/// Meal
///
/// strMeal: Name of meal
/// strCategory: Meal category, e.g. Dessert
/// strInstructions: Recipe directions
/// idMeal: recipe Unique meal ID
/// strIIngredient1..20: Meal Ingredients (may be blank value)
struct Recipe: Decodable {
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let idMeal: String
    let strIngredient1: String
    let strIngredient2: String
    let strIngredient3: String
    let strIngredient4: String
    let strIngredient5: String
    let strIngredient6: String
    let strIngredient7: String
    let strIngredient8: String
    let strIngredient9: String
    let strIngredient10: String
    let strIngredient11: String
    let strIngredient12: String
    let strIngredient13: String
    let strIngredient14: String
    let strIngredient15: String
    let strIngredient16: String
    let strIngredient17: String
    let strIngredient18: String
    let strIngredient19: String
    let strIngredient20: String
}
