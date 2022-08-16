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
    var recipe: Recipe = Recipe.mock
    
    var body: some View {
        ScrollView {
            VStack {
                RecipeImageView(recipe: recipe)
                    .frame(
                        width: UIScreen.main.bounds.size.width,
                        height: UIScreen.main.bounds.size.width
                    )
                
                RecipeBadgeView(recipe: recipe)
                
                VStack(alignment: .leading) {
                    RecipeIngredientsView(recipe: recipe)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                Spacer()
                RecipeInstructionButtonView(recipe: recipe)
            }
        }
        .navigationTitle(recipe.label)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                favoriteButton
            }
        }
    }
}

extension RecipeView {
    var favoriteButton: some View {
        Button {
            if let favorite = favorites.first(where: { $0.uri == recipe.uri }) {
                $favorites.remove(favorite)
            } else {
                $favorites.append(RecipeEntity.from(recipe))
            }
        } label: {
            if favorites.first(where: { $0.uri == recipe.uri }) != nil {
                Image(systemName: "heart.fill")
                    .accessibilityLabel("Save this recipe as a favorite.")
            } else {
                Image(systemName: "heart")
                    .accessibilityLabel("Save this recipe as a favorite.")
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
