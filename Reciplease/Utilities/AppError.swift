//
//  AppError.swift
//  Reciplease
//
//  Created by Paul Oggero on 06/08/2022.
//

import Foundation
import Alamofire

enum CRUDError: Error {
    case emptyIngredient, alreadyInUse, emptySearch
}

extension CRUDError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyIngredient:
            return "You can't add an empty ingredient."
        case .alreadyInUse:
            return "You already added this ingredient."
        case .emptySearch:
            return "You can't search with no ingredients in your list."
        }
    }
}

struct AppError: Identifiable {
    let id: UUID
    let error: LocalizedError

    init(error: LocalizedError) {
        self.id = UUID()
        self.error = error
    }
    
    func getDescription() -> String {
        error.localizedDescription
    }
}

