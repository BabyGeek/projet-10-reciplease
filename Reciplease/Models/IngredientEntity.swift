//
//  IngredientEntity.swift
//  Reciplease
//
//  Created by Paul Oggero on 09/08/2022.
//
// Entity for Realm Ingredient object

import Foundation
import RealmSwift

class IngredientEntity: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
