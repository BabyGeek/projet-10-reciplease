//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []
    @Published var results: [Recipe] = []
    
    var error: Error? = nil
    var isLoading: Bool = false
    
    private var service: SearchServicing
    
    
    init(service: SearchServicing) {
        self.service = service
    }
    
    public func fetchData() {
        self.isLoading = true
        service.parameters = ["q": ingredients.map { $0.name }.joined(separator: " ")]

        service.getSearch { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponse):
                    self?.results = searchResponse.recipes
                case .failure(let error):
                    self?.error = error
                }
            }
        }
        self.isLoading = false
    }
    
    public func addIngredient(_ ingredient: String) {
        if ingredient.isEmpty {
            // Error empty
            return
        } else if ingredients.first(where: { $0.name == ingredient }) != nil {
            // Error already in list
            return
        }

        ingredients.append(Ingredient(name: ingredient))
    }
    
    public func cleanIngredients() {
        ingredients = []
    }
}
