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
            let recipe = favorites[index].toRecipe()
            NavigationLink(destination: RecipeView(recipe: recipe), tag: index, selection: $selection) {
                RecipeRowView2(recipe: recipe)
            }
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
