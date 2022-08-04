//
//  SearchViewModel.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var results: [Recipe] = []
    @Published var search: String? = "Eggs tomato avocado"
    
    var error: Error? = nil
    
    private var service: SearchServicing
    
    
    init(service: SearchServicing) {
        self.service = service
    }
    
    public func fetchData() {
        if let search = search {
            service.search = search
        }

        service.getSearch { [weak self] result in
            switch result {
            case .success(let searchResponse):
                self?.results = searchResponse.recipes
            case .failure(let error):
                self?.error = error
            }
        }
    }
}
