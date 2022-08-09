//
//  RecipeEntity.swift
//  Reciplease
//
//  Created by Paul Oggero on 09/08/2022.
//

import Foundation
import RealmSwift

class RecipeEntity: Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var totalTime: Int
    @Persisted var calories: Double
    @Persisted var label: String
    @Persisted var ingredientLines = List<String>()
    @Persisted var image: String
    @Persisted var url: String
    @Persisted var cuisineType = List<String>()
    @Persisted var mealType = List<String>()
    @Persisted var dishType = List<String>()
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    public func toRecipe() -> Recipe {
        return Recipe(totalTime: totalTime, calories: calories, label: label, ingredientLines: Array(ingredientLines), image: image, url: url, cuisineType: Array(cuisineType), mealType: Array(mealType), dishType: Array(dishType))
    }
}
