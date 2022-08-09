//
//  RecipeListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct RecipeRowView: View {
    var recipe: Recipe = Recipe.mock
    var isAccessibilityElement: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("CardBackground").opacity(0.5))
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
                .padding(.horizontal)
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
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: .white, radius: 5, x: 3, y: 5)
                .frame(width: 80, height: 80)
            
        }, placeholder: {
            placeholderImage()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .overlay(ProgressView())
                .frame(width: 80, height: 80)
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
            
            RecipeBadgeView(recipe: recipe)
            
            Spacer()
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView()
            .preferredColorScheme(.dark)
    }
}
