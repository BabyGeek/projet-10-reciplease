//
//  SearchServicing.swift
//  Reciplease
//
//  Created by Paul Oggero on 10/08/2022.
//

import Alamofire
import Combine

/// SearchServicing protocol
protocol SearchServicing {
    var parameters: Parameters? { get set }
    var task: Cancellable? { get set }
    func get(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void)
}
