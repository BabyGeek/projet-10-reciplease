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
    let time: Double
    let likes: Double
    let label: String
    let ingredientLines: [String]
    let imageURL: String
    
    static var mock = Recipe(name: "Pizza", time: 3, likes: 2500, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
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
      ], imageURL: "https://tastykitchen.com/recipes/wp-content/uploads/sites/2/2011/08/IMGP2288-1-410x307.jpg")
    
    
    init(name: String, time: Double, likes: Double, label: String, ingredientLines: [String], imageURL: String) {
        self.name = name
        self.time = time
        self.likes = likes
        self.label = label
        self.ingredientLines = ingredientLines
        self.imageURL = imageURL
    }
}
