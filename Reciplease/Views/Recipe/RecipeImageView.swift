//
//  RecipeImageView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SwiftUI

struct RecipeImageView: View {
    var recipe: Recipe = Recipe.mock

    var body: some View {
        VStack {
            HStack {
                Text("\(Image(systemName: "hand.thumbsup.fill")) \(recipe.likes)")
                Spacer()
                Text("\(recipe.time) \(Image(systemName: "timer"))")
            }
            .padding(.top)
            Spacer()
            
            HStack {
                Text(recipe.name)
                    .font(.system(.title))
                Spacer()
            }
        }
        .background(
            AsyncImage(url: URL(string: recipe.imageURL))
                .scaledToFit()
                .mask(
                    LinearGradient(gradient: Gradient(
                        colors: [
                            .black,
                            .black,
                            .black,
                            .clear]
                    ),
                                   startPoint: .bottom,
                                   endPoint: .top)
                ))
        .frame(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.width
        )
    }
}

struct RecipeImageView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImageView()
    }
}
