//
//  SearchService.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Alamofire
import Foundation

protocol SearchServicing {
    var parameters: Parameters? { get set }
    func getSearch(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void)
}

class SearchService: NetworkManager, SearchServicing {
    var parameters: Parameters?
    
    func getSearch(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        let url = "https://api.edamam.com/api/recipes/v2?type=public&app_id=fea4df48&app_key=d188677a672a589fa4898f6a4e470fa6"
        
        get(url: url, parameters: parameters) { response in
            completion(response.result)
        }
    }
}

class SearchMockService: SearchServicing {
    var parameters: Parameters?
    var getCallCounter = 0
    
    func getSearch(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        getCallCounter += 1
        
        let response = SearchResponse(recipes: [
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
        ])
        
        completion(.success(response))
    }
}

