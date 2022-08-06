//
//  Ingredient.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import Foundation
import RealmSwift

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getEntity() -> IngredientEntity {
        let entity = IngredientEntity()
        entity.name = self.name
        return entity
    }
}

class IngredientEntity: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
