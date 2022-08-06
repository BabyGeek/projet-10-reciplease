//
//  FavoriteView.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import RealmSwift
import SwiftUI

struct FavoriteView: View {
    @ObservedResults(RecipeEntity.self) var favorites
    var body: some View {
        if favorites.isEmpty {
            Text("Please add your first favorite recipe by clicking on the \(Image(systemName: "star")) symbol.")
        }
        
        List {
            FavoriteListView()
        }
        .listStyle(.plain)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
