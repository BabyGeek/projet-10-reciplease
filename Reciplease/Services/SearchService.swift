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
    
    func get(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        let url = ConstantsAPI.url.replacingOccurrences(of: "{id}", with: ConstantsAPI.appID).replacingOccurrences(of: "{key}", with: ConstantsAPI.apiKEY)
        
        self.task = AF.request(url, method: .get, parameters: parameters)
            .publishDecodable(type: SearchResponse.self)
            .sink(receiveCompletion: { (failure) in
                switch failure {
                case .finished:
                    ()
                case .failure(let error):
                    if let error = error.asAFError {
                        let result: Result<SearchResponse, AFError> = .failure(error)
                        completion(result)
                    }
                }
            }, receiveValue: { (response) in
                completion(response.result)
            })
    }
}

