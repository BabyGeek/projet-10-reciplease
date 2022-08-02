//
//  Ingredient.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
