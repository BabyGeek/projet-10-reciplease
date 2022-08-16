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
    @available(*, renamed: "get()")
    func get(_ handler: @escaping (Result<SearchResponse, AFError>) -> Void)

    func get() async throws -> SearchResponse
}
