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
    let ingredients: String
    let imageURL: String
    
    static var mock = Recipe(name: "Pizza", time: 3, likes: 2500, ingredients: "Mozzarella, Basil, Large tomato", imageURL: "https://tastykitchen.com/recipes/wp-content/uploads/sites/2/2011/08/IMGP2288-1-410x307.jpg")
    
    
    init(name: String, time: Double, likes: Double, ingredients: String, imageURL: String) {
        self.name = name
        self.time = time
        self.likes = likes
        self.ingredients = ingredients
        self.imageURL = imageURL
    }
}
