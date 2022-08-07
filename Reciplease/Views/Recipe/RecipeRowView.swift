//
//  RecipeListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct RecipeRowView: View {
    var recipe: Recipe = Recipe.mock
    var body: some View {
        Capsule()
            .fill(Color("CardBackground"))
            .frame(height: 100)
            .overlay(
                main
                .padding()
                .foregroundColor(Color("Text"))
            )
    }
}

extension RecipeRowView {
    var main: some View {
        HStack {
            image

            informations
        }
    }
}


extension RecipeRowView {
    var image: some View {
        AsyncImage(url: URL(string: recipe.image), content: {
            image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("Primary"), lineWidth: 1.2))
            
        }, placeholder: {
            placeholderImage()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(ProgressView())
        })
    }
}

extension RecipeRowView {
    var informations: some View {
        VStack(alignment: .leading) {
            Text("\(recipe.label)")
                .font(.title2)
                .lineLimit(1)
            
            Spacer()

            HStack {
                Text("\(Image(systemName: "flame")) \(recipe.getCalories())")
                    .font(.body)
                Spacer()
                Text("\(recipe.getTime()) \(Image(systemName: "timer"))")
                    .font(.body)
                
                Image(systemName: "chevron.right")
                    .padding(.horizontal)
            }
            Spacer()
            RecipeBadgeView(recipe: recipe)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView()
            .preferredColorScheme(.dark)
    }
}
