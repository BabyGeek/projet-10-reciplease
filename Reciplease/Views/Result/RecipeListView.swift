//
//  RecipeListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct RecipeListView: View {
    var recipe: Recipe = Recipe.mock
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(recipe.likes) \(Image(systemName: "hand.thumbsup.fill"))")
                    Text("\(recipe.time) \(Image(systemName: "timer"))")
                }
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(recipe.name)
                Text(recipe.ingredients)
            }
        }
        .foregroundColor(Color("Text"))
        .background(
            AsyncImage(url: URL(string: recipe.imageURL))
        )
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
