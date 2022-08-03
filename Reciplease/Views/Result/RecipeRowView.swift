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
        VStack(alignment: .leading) {
            HStack {
                Text("\(recipe.calories) \(Image(systemName: "flame"))")
                Spacer()
                Text("\(recipe.totalTime) \(Image(systemName: "timer"))")
            }
            Spacer()
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title3)
                Text(recipe.label)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
        .foregroundColor(Color("Text"))
        .padding(.horizontal)
        .frame(height: 180)
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView()
            .preferredColorScheme(.dark)
    }
}
