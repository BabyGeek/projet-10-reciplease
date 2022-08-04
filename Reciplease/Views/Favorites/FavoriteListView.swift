//
//  FavoriteListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import SwiftUI

struct FavoriteListView: View {
    var favorites = [
        Recipe.mockFavorite,
        Recipe.mockFavorite,
        Recipe.mockFavorite,
        Recipe.mockFavorite
    ]

    @State var selection: Int? = -1
    
    var body: some View {
        ForEach(favorites.indices, id: \.self) { index in
            let recipe = favorites[index]
            NavigationLink(destination: RecipeView(recipe: recipe), tag: index, selection: $selection) {
                RecipeRowView(recipe: recipe)
            }
            
            Divider()
                .padding()
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
            .preferredColorScheme(.dark)
    }
}
