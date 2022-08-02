//
//  RecipeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    var body: some View {
        ZStack {
            
                AsyncImage(url: URL(string: recipe.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    Color("Background")
                        .opacity(0.4)
                }
            
                Color.black
                    .opacity(0.3)

            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("\(recipe.likes) \(Image(systemName: "hand.thumbsup.fill"))")
                        Text("\(recipe.time) \(Image(systemName: "timer"))")
                    }
                }
                HStack {
                    Text(recipe.name)
                    Text(recipe.ingredients)
                }
            }
        }
        .frame(height: 120)
        .foregroundColor(Color("Text"))
        .padding(.bottom)
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.mock)
    }
}
