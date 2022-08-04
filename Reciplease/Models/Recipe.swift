//
//  Recipe.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct Recipe: Identifiable, Codable {
    let id: UUID
    let totalTime: Double
    let calories: Double
    let label: String
    let ingredientLines: [String]
    let image: String
    let url: String
    let isFavorite: Bool
    
    static var mock = Recipe(totalTime: 3, calories: 2871.0704237333985, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
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
    ], image: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=509&height=340", url: "http://www.seriouseats.com/recipes/2013/03/chorizo-avocado-egg-cemitas-chipotle-mayonnaise-recipe.html")
    
    static var mockFavorite = Recipe(totalTime: 3, calories: 2871.0704237333985, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
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
    ], image: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=509&height=340", url: "http://www.seriouseats.com/recipes/2013/03/chorizo-avocado-egg-cemitas-chipotle-mayonnaise-recipe.html", isFavorite: true)
    
    enum CodingKeys: String, CodingKey {
        case label
        case totalTime
        case calories
        case ingredientLines
        case image
        case url
    }
    
    init(totalTime: Double, calories: Double, label: String, ingredientLines: [String], image: String, url: String, isFavorite: Bool = false) {
        self.id = UUID()
        self.totalTime = totalTime
        self.calories = calories
        self.label = label
        self.ingredientLines = ingredientLines
        self.image = image
        self.url = url
        self.isFavorite = isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        totalTime = try values.decode(Double.self, forKey: .totalTime)
        calories = try values.decode(Double.self, forKey: .calories)
        label = try values.decode(String.self, forKey: .label)
        ingredientLines = try values.decode([String].self, forKey: .ingredientLines)
        image = try values.decode(String.self, forKey: .image)
        url = try values.decode(String.self, forKey: .url)
        isFavorite = false
    }
}
