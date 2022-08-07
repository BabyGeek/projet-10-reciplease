//
//  RecipeIngredientsView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SwiftUI

struct RecipeIngredientsView: View {
    var recipe: Recipe = Recipe.mock

    var body: some View {
        List(recipe.ingredientLines, id: \.self) { line in
            Text(line)
                .font(.body)
                .lineLimit(0)
        }
        .foregroundColor(Color("Text"))
        .listRowSeparatorTint(.black, edges: .all)
    }
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredientsView()
            .preferredColorScheme(.dark)
    }
}
