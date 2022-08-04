//
//  SearchResponse.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation


struct SearchResponse: Codable {
    let from: Int
    let to: Int
    let count: Int
    let hits: [RecipeResponse]
    var recipes: [Recipe]
    
    
    enum CodingKeys: String, CodingKey {
        case from
        case to
        case count
        case hits
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        from = try values.decode(Int.self, forKey: .from)
        to = try values.decode(Int.self, forKey: .to)
        count = try values.decode(Int.self, forKey: .count)
        hits = try values.decode([RecipeResponse].self, forKey: .hits)

        recipes = []
        
        for hit in hits {
            recipes.append(hit.recipe)
        }
    }
    
    init(recipes: [Recipe]) {
        self.hits = []
        self.recipes = recipes
        self.from = 0
        self.to = recipes.count
        self.count = recipes.count
    }
}
