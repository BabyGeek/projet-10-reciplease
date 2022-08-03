//
//  RecipeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe = Recipe.mock
    
    var body: some View {
        ScrollView {
            RecipeImageView(recipe: recipe)
            Spacer()
            RecipeIngredientsView(recipe: recipe)
            RecipeInstructionButtonView(recipe: recipe)
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    //
                } label: {
                    Image(systemName: "star")
                }
                
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeView()
                .preferredColorScheme(.dark)
        }
    }
}
