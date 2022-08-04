//
//  RecipeResponse.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation

struct RecipeResponse: Codable {
    let recipe: Recipe
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recipe = try values.decode(Recipe.self, forKey: .recipe)
        
    }
}
    
