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
                RecipeRowView(recipe: recipe)
            }
            .listRowBackground(
                AsyncImage(url: URL(string: recipe.image), content: {
                    image in
                    image
                        .resizable()
                        .mask(
                            LinearGradient(gradient: Gradient(
                                colors: [
                                    .clear,
                                    .black,
                                    .black,
                                    .black,
                                    .clear]
                            ),
                                           startPoint: .bottom,
                                           endPoint: .top)
                        )
                }, placeholder: {
                    ProgressView()
                }))
            .frame(height: 170)
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
            .preferredColorScheme(.dark)
    }
}
