//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation
import RealmSwift

class RecipeViewModel: ObservableObject {
    @Published var results: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var error: AppError?
    @Published var totalResults: Int?

    private var service: SearchServicing

    init(service: SearchServicing) {
        self.service = service
    }

    public func fetchData(_ ingredients: [Ingredient]? = nil) {
        isLoading = true
        self.totalResults = nil
        self.results = []
        
        if let ingredients = ingredients {
            service.parameters = ["q": ingredients.map { $0.name }.joined(separator: " ")]
        }

        service.get { [weak self] result in
            switch result {
            case .success(let searchResponse):
                self?.totalResults = searchResponse.count
                self?.results = searchResponse.recipes
            case .failure(let error):
                self?.error = AppError(error: error)
            }
        }
        
        isLoading = false
    }
    
    /// Determine if a recipe is in favorites, based on edamam uri
    /// - Parameter recipe: recipe to check
    /// - Parameter favorites: Array to check
    /// - Returns: True is it is a favorite recipe, else false
    public func isFavorite(_ recipe: Recipe, favorites: [Any]) -> Bool {
        
        return false
    }
    
    /// Handle ingredient adding
    /// - Parameter ingredient: the ingredient name to add
    /// - Returns: True if the user can add the ingredient, else false
    public func isValidIngredient(_ ingredient: String) -> Bool {
        if ingredient.isEmpty {
            error = AppError(error: CRUDError.emptyIngredient)
            return false
        }
        
        return true
    }
}
