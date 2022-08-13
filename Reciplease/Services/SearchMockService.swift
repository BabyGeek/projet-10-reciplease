//
//  SearchMockService.swift
//  Reciplease
//
//  Created by Paul Oggero on 10/08/2022.
//

import Alamofire
import Combine

/// Search mock service, used to handle Search mock for development, debug or test
class SearchMockService: SearchServicing {
    internal var task: Cancellable? = nil
    
    var parameters: Parameters?
    var getCallCounter = 0
    
    func get(_ handler: @escaping (Result<SearchResponse, AFError>) -> Void) {
        getCallCounter += 1
        
        let response = SearchResponse(recipes: [
            Recipe.mock,
            Recipe.mock,
            Recipe.mock,
        ])
        
        handler(.success(response))
    }
    
    func get() async throws -> SearchResponse {
        return try await withCheckedThrowingContinuation { continuation in
            get { result in
                continuation.resume(with: result)
            }
        }
    }
}
