//
//  FavoriteListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import RealmSwift
import SwiftUI

struct FavoriteListView: View {
    @ObservedResults(RecipeEntity.self) var favorites
    @State var selection: Int? = -1
    
    var body: some View {
        ForEach(favorites.indices, id: \.self) { index in
            let recipe = favorites[index].toModel()
            NavigationLink(destination: RecipeView(recipe: recipe), tag: index, selection: $selection) {
                RecipeRowView(recipe: recipe)
            }
            .accessibilityLabel("\(recipe.label), takes \(recipe.getTime()) to prepare, has \(recipe.getCalories()) calories, \(recipe.getCuisineType()) cuisine, best for \(recipe.getMealType()), \(recipe.getDishType()) dish. Click to show ingredients and instructions.")
        }
        .onDelete(perform: $favorites.remove)
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
            .preferredColorScheme(.dark)
    }
}
