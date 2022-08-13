//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation
import RealmSwift
import Alamofire

class RecipeViewModel: ObservableObject {
    @Published var results: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var error: AppError?
    @Published var totalResults: Int?
    
    private var service: SearchServicing
    
    init(service: SearchServicing) {
        self.service = service
    }
    
    func fetchData(_ ingredients: [Ingredient]? = nil) async {
        self.totalResults = nil
        self.results = []
        
        if let ingredients = ingredients {
            service.parameters = ["q": ingredients.map { $0.name }.joined(separator: " ")]
        }
        
        self.isLoading = true
        
        do {
            let response = try await service.get()
            self.totalResults = response.count
            self.results = response.recipes
        } catch {
            if let error = error.asAFError {
                self.error = AppError(error: error)
            }
        }
        
        self.isLoading = false
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
