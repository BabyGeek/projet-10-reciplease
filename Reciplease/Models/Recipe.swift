//
//  Recipe.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import Foundation
import RealmSwift

struct Recipe: Codable, Equatable {
    let totalTime: Int
    let calories: Double
    let label: String
    let ingredientLines: [String]
    let image: String
    let url: String
    let cuisineType: [String]
    let mealType: [String]
    let dishType: [String]
    
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
    
    init(totalTime: Int, calories: Double, label: String, ingredientLines: [String], image: String, url: String, cuisineType: [String], mealType: [String], dishType: [String]) {
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalTime = try values.decode(Int.self, forKey: .totalTime)
        calories = try values.decode(Double.self, forKey: .calories)
        label = try values.decode(String.self, forKey: .label)
        ingredientLines = try values.decode([String].self, forKey: .ingredientLines)
        image = try values.decode(String.self, forKey: .image)
        url = try values.decode(String.self, forKey: .url)
        cuisineType = try values.decode([String].self, forKey: .cuisineType)
        mealType = try values.decode([String].self, forKey: .mealType)
        dishType = try values.decode([String].self, forKey: .dishType)
    }
    
    func getEntity() -> RecipeEntity {
        let entity = RecipeEntity()
        entity.totalTime = self.totalTime
        entity.calories = self.calories
        entity.label = self.label
        entity.ingredientLines.append(objectsIn: self.ingredientLines)
        entity.image = self.image
        entity.url = self.url
        entity.cuisineType.append(objectsIn: self.cuisineType)
        entity.mealType.append(objectsIn: self.mealType)
        entity.dishType.append(objectsIn: self.dishType)
        return entity
    }
    
    func getTime() -> String {
        let hours = "\(totalTime / 60 < 10 ? "0\(totalTime / 60)" : "\(totalTime / 60)")"
        let minutes = "\(totalTime % 60 < 10 ? "0\(totalTime % 60)" : "\(totalTime % 60)")"
        let dateString = "\(hours)h\(minutes)"

        return dateString
    }
    
    func getCalories() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.usesGroupingSeparator = true
        
        if let calories = numberFormatter.string(from: calories as NSNumber) {
            return calories
        }
        
        return ""
    }
    
    func getCuisineType() -> String {
        return cuisineType.joined(separator: ", ")
    }
    
    func getMealType() -> String {
        return mealType.joined(separator: ", ")
    }
    
    func getDishType() -> String {
        return dishType.joined(separator: ", ")
    }
}

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
