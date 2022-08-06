//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation
import RealmSwift

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var results: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var error: AppError?
    @Published var totalResults: Int?
    
    var ingredients: Results<IngredientEntity> {
        let realm = try! Realm()
        return realm.objects(IngredientEntity.self)
    }
    
    var favorites: Results<RecipeEntity> {
        let realm = try! Realm()
        return realm.objects(RecipeEntity.self)
    }
    
    
    private var service: SearchServicing
    
    init(service: SearchServicing) {
        self.service = service
    }
    
    public func fetchData() {
        isLoading = true
        self.totalResults = nil
        self.results = []
        
        service.parameters = ["q": ingredients.map { $0.name }.joined(separator: " ")]
        
        service.getSearch { [weak self] result in
            switch result {
            case .success(let searchResponse):
                self?.totalResults = searchResponse.count
                self?.results = searchResponse.recipes
            case .failure(let error):
                dump(error)
                self?.error = AppError(error: error)
            }
        }
        
        isLoading = false
    }
    
    public func cleanIngredients() {
        let realm = try! Realm()
        
        try! realm.write {
            let allIngredients = realm.objects(IngredientEntity.self)
            realm.delete(allIngredients)
        }
    }

    public func isFavorite(_ recipe: Recipe) -> Bool {
        if let _ = favorites.first(where: { $0.label == recipe.label}) {
            return true
        }
        
        return false
    }
}
