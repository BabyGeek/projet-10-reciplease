//
//  AppError.swift
//  Reciplease
//
//  Created by Paul Oggero on 06/08/2022.
//

import Foundation
import Alamofire

struct AppError: Identifiable {
    let id: UUID
    let error: AFError

    init(error: AFError) {
        self.id = UUID()
        self.error = error
    }
    
    func getDescription() -> String {
        if let description = error.errorDescription {
            return description
        }
        
        return ""
    }
}
