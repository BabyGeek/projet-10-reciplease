//
//  RecipeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import RealmSwift
import SwiftUI

struct RecipeView: View {
    @ObservedResults(RecipeEntity.self) var favorites
    @EnvironmentObject var viewModel: RecipeViewModel
    var recipe: Recipe = Recipe.mock
    
    var body: some View {
        VStack {
            RecipeImageView(recipe: recipe)
                .frame(
                    width: UIScreen.main.bounds.size.width,
                    height: UIScreen.main.bounds.size.width
                )
            
            RecipeBadgeView(recipe: recipe)
            RecipeIngredientsView(recipe: recipe)
            
            RecipeInstructionButtonView(recipe: recipe)
        }
        .navigationTitle(recipe.label)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    if viewModel.isFavorite(recipe), let favorite = favorites.first(where: { $0.label == recipe.label }) {
                        $favorites.remove(favorite)
                    } else {
                        $favorites.append(recipe.getEntity())
                    }
                } label: {
                    Image(systemName: viewModel.isFavorite(recipe) ? "star.fill" : "star")
                        .accessibilityLabel("Save this recipe as a favorite.")
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
