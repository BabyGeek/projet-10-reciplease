//
//  Recipe.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import Foundation

struct Recipe: Codable, Equatable {
    let uri: String
    let totalTime: Int
    let calories: Double
    let label: String
    let ingredientLines: [String]
    let image: String
    let url: String
    let cuisineType: [String]?
    let mealType: [String]?
    let dishType: [String]?
    
    static var mock = Recipe(uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_7a844b79a5df3f11e822cc229bfb3981", totalTime: 3, calories: 2871.0704237333985, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
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
    ], image: "https://static.toiimg.com/thumb/56933159.cms?imgsize=686279&width=509&height=340", url: "http://www.seriouseats.com/recipes/2013/03/chorizo-avocado-egg-cemitas-chipotle-mayonnaise-recipe.html", cuisineType: [
        "mediterranean"
      ],
      mealType: [
        "lunch/dinner"
      ],
      dishType: [
        "sandwiches"
      ])
    
    enum CodingKeys: String, CodingKey {
        case uri
        case label
        case totalTime
        case calories
        case ingredientLines
        case image
        case url
        case cuisineType
        case mealType
        case dishType
    }
    
    init(uri: String, totalTime: Int, calories: Double, label: String, ingredientLines: [String], image: String, url: String, cuisineType: [String]?, mealType: [String]?, dishType: [String]?) {
        self.uri = uri
        self.totalTime = totalTime
        self.calories = calories
        self.label = label
        self.ingredientLines = ingredientLines
        self.image = image
        self.url = url
        self.cuisineType = cuisineType
        self.mealType = mealType
        self.dishType = dishType
    }
    
    /// Get the time of preparation, format 00h00
    /// - Returns: String time
    func getTime() -> String {
        let hours = "\(totalTime / 60 < 10 ? "0\(totalTime / 60)" : "\(totalTime / 60)")"
        let minutes = "\(totalTime % 60 < 10 ? "0\(totalTime % 60)" : "\(totalTime % 60)")"
        let dateString = "\(hours)h\(minutes)"

        return dateString
    }
    
    func getCalories() -> String {
        NumberFormatter().string(from: calories as NSNumber) ?? ""
    }
    
    func getCuisineType() -> String {
        cuisineType?.joined(separator: ", ") ?? "N/A"
    }
    
    func getMealType() -> String {
        mealType?.joined(separator: ", ") ?? "N/A"
    }
    
    func getDishType() -> String {
        dishType?.joined(separator: ", ") ?? "N/A"
    }
    
    /// Get the list of ingredients as identifiable objects
    /// - Returns: Array of Ingredients
    func getIngredients() -> [Ingredient] {
        var ingredients = [Ingredient]()
        ingredientLines.forEach { line in
            if let line = line.removingPercentEncoding {
                ingredients.append(Ingredient(name: line))
            }
        }

        return ingredients
    }
}
