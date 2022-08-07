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
                Text("\(Image(systemName: "flame")) \(recipe.getCalories())")
                    .accessibilityLabel("\(recipe.getCalories()) calories.")
                    .font(.body)
                    .lineLimit(1)

                Spacer()
                Text("\(recipe.getTime()) \(Image(systemName: "timer"))")
                    .accessibilityLabel("\(recipe.getTime()) minutes to prepare it.")
                    .font(.body)
                    .lineLimit(1)

            }

            Spacer()
            
            HStack {
                Text(recipe.label)
                    .font(.system(.title3))
                    .lineLimit(1)
                Spacer()
            }
        }
        .background(
            AsyncImage(url: URL(string: recipe.image), content: { image in
                    image
                    .resizable()
                    .scaledToFill()
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
                    )
                    .mask(
                        LinearGradient(gradient: Gradient(
                            colors: [
                                .black,
                                .black,
                                .black,
                                .clear]
                        ),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    )
            }, placeholder: {
                placeholderImage()
                    .overlay(ProgressView())
            }))
    }
}

struct RecipeImageView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImageView()
    }
}
