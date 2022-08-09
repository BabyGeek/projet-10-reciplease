//
//  RecipeEntity.swift
//  Reciplease
//
//  Created by Paul Oggero on 09/08/2022.
//
// Entity for Realm Recipe object

import Foundation
import RealmSwift

class RecipeEntity: Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var uri: String
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
    
    public func toModel() -> Recipe {
        return Recipe(uri: uri, totalTime: totalTime, calories: calories, label: label, ingredientLines: Array(ingredientLines), image: image, url: url, cuisineType: Array(cuisineType), mealType: Array(mealType), dishType: Array(dishType))
    }
    
    static func from(_ recipe: Recipe) -> RecipeEntity {
        let entity = RecipeEntity()
        entity.uri = recipe.uri
        entity.totalTime = recipe.totalTime
        entity.calories = recipe.calories
        entity.label = recipe.label
        entity.ingredientLines.append(objectsIn: recipe.ingredientLines)
        entity.image = recipe.image
        entity.url = recipe.url
        entity.cuisineType.append(objectsIn: recipe.cuisineType ?? [])
        entity.mealType.append(objectsIn: recipe.mealType ?? [])
        entity.dishType.append(objectsIn: recipe.dishType ?? [])
        
        return entity
    }
}
