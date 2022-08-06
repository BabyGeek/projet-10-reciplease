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
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(recipe.calories) \(Image(systemName: "flame"))")
                        .buttonStyle(.bordered)
                        .tint(Color("Text"))
                    Text("\(recipe.totalTime) \(Image(systemName: "timer"))")
                        .buttonStyle(.bordered)
                        .tint(Color("Text"))
                }
                .padding(.horizontal)
                .background(
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color("CardBackground").opacity(0.7))
                )
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
