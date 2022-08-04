//
//  Recipe.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let totalTime: Double
    let calories: Double
    let label: String
    let ingredientLines: [String]
    let imageURL: String
    let url: String
    let isFavorite: Bool
    
    static var mock = Recipe(name: "Pizza", totalTime: 3, calories: 2871.0704237333985, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
        "1/4 cup mayonnaise",
        "1 teaspoon fresh lime juice from 1 lime",
        "1 chipotle pepper in adobo sauce, chopped, plus 1 tablespoon adobo sauce",
        "12 ounces Mexican chorizo sausage",
        "2 eggs",
        "2 large cemita rolls, bolillo rolls, or Kaiser rolls",
        "2 ounces Oaxacan cheese, or mozzarella, torn into pieces",
        "1/2 cup shredded iceberg lettuce",
        "1 small tomato, sliced",
        "1 avocado, sliced"
    ], imageURL: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=509&height=340", url: "http://www.seriouseats.com/recipes/2013/03/chorizo-avocado-egg-cemitas-chipotle-mayonnaise-recipe.html")
    
    static var mockFavorite = Recipe(name: "Pizza", totalTime: 3, calories: 2871.0704237333985, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
        "1/4 cup mayonnaise",
        "1 teaspoon fresh lime juice from 1 lime",
        "1 chipotle pepper in adobo sauce, chopped, plus 1 tablespoon adobo sauce",
        "12 ounces Mexican chorizo sausage",
        "2 eggs",
        "2 large cemita rolls, bolillo rolls, or Kaiser rolls",
        "2 ounces Oaxacan cheese, or mozzarella, torn into pieces",
        "1/2 cup shredded iceberg lettuce",
        "1 small tomato, sliced",
        "1 avocado, sliced"
    ], imageURL: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=509&height=340", url: "http://www.seriouseats.com/recipes/2013/03/chorizo-avocado-egg-cemitas-chipotle-mayonnaise-recipe.html", isFavorite: true)
    
    init(name: String, totalTime: Double, calories: Double, label: String, ingredientLines: [String], imageURL: String, url: String, isFavorite: Bool = false) {
        self.name = name
        self.totalTime = totalTime
        self.calories = calories
        self.label = label
        self.ingredientLines = ingredientLines
        self.imageURL = imageURL
        self.url = url
        self.isFavorite = isFavorite
    }
}
