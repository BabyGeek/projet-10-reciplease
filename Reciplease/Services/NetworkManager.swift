//
//  NetworkManager.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Alamofire


class NetworkManager {
    func get<T: Decodable>(url: URLConvertible, parameters: Parameters?,_ completion: @escaping (DataResponse<T, AFError>) -> Void) {
        AF.request(url, parameters: parameters)
        .responseDecodable(of: T.self) { response in
            completion(response)
        }
    }
}
