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
        ForEach(recipe.ingredientLines, id: \.self) { line in
            Text(line)
                .frame(alignment: .leading)
        }
    }
}

struct RecipeIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredientsView()
    }
}
