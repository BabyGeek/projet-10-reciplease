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
                Text(recipe.label)
                    .font(.subheadline)
                    .lineLimit(1)
            }
        }
        .foregroundColor(Color("Text"))
        .frame(height: 200)
        .background(
            AsyncImage(url: URL(string: recipe.image), content: {
                image in
                image
                    .resizable()
                    .frame(height: 120)
            }, placeholder: {
                ProgressView()
            }))
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRowView()
            .preferredColorScheme(.dark)
    }
}
