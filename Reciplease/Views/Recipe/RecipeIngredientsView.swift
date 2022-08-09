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
        ForEach(recipe.getIngredients(), id: \.id) { ingredient in
            Text("- \(ingredient.name)")
                .font(.body)
        }
        .foregroundColor(Color("Text"))
    }
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredientsView()
            .preferredColorScheme(.dark)
    }
}
