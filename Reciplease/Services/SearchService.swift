//
//  SearchService.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Alamofire
import Combine

protocol SearchServicing {
    var parameters: Parameters? { get set }
    var task: Cancellable? { get set }
    func get(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void)
}

class SearchService: SearchServicing {
    internal var task: Cancellable? = nil
    
    var parameters: Parameters?
    
    func get(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        let url = ConstantsAPI.url.replacingOccurrences(of: "{id}", with: ConstantsAPI.appID).replacingOccurrences(of: "{key}", with: ConstantsAPI.apiKEY)
        
        self.task = AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: SearchResponse.self)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    if let error = error.asAFError {
                        let result: Result<SearchResponse, AFError> = .failure(error)
                        //completion(result)
                    }
                }
            }, receiveValue: { (response) in
                completion(response.result)
            })
    }
}

class SearchMockService: SearchServicing {
    internal var task: Cancellable? = nil
    
    var parameters: Parameters?
    var getCallCounter = 0
    
    func get(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        getCallCounter += 1
        
        let response = SearchResponse(recipes: [
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
        ])
        
        completion(.success(response))
    }
}

