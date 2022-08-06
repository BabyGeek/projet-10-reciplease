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
        VStack {
            HStack {
                    Text("\(recipe.getCalories()) \(Image(systemName: "flame"))")
                Spacer()
                    Text("\(recipe.getTime()) \(Image(systemName: "timer"))")
            }
            
            Spacer()
            HStack {
                Text(recipe.label)
                    .font(.subheadline)
                    .lineLimit(1)
                Spacer()
            }
        }
        .foregroundColor(Color("Text"))
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView()
            .preferredColorScheme(.dark)
    }
}
