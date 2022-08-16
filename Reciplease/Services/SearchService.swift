//
//  SearchService.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Alamofire
import Combine

/// Search service, used to handle Search task
class SearchService: SearchServicing {
    internal var task: Cancellable? = nil
    
    var parameters: Parameters?
    
    func get(_ handler: @escaping (Result<SearchResponse, AFError>) -> Void) {
        let url = ConstantsAPI.url
            .replacingOccurrences(of: "{id}", with: ConstantsAPI.appID)
            .replacingOccurrences(of: "{key}", with: ConstantsAPI.apiKEY)
        
        self.task?.cancel()
        self.task = AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: SearchResponse.self)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    if let error = error.asAFError {
                        let result: Result<SearchResponse, AFError> = .failure(error)
                        handler(result)
                    }
                }
            }, receiveValue: { (response) in
                handler(response.result)
            })
    }
    
    func get() async throws -> SearchResponse {
        return try await withCheckedThrowingContinuation { continuation in
            get { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
