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
        VStack {
            RecipeImageView(recipe: recipe)
                .frame(
                    width: UIScreen.main.bounds.size.width,
                    height: UIScreen.main.bounds.size.width
                )
            Spacer()
            ScrollView(.vertical, showsIndicators: true, content: {
                RecipeIngredientsView(recipe: recipe)
            })
            Spacer()
            RecipeInstructionButtonView(recipe: recipe)
        }
        .navigationTitle(recipe.label)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    //
                } label: {
                    Image(systemName: recipe.isFavorite ? "star.fill" : "star")
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
