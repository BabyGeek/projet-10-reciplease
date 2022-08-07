//
//  RecipeBadgeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 08/08/2022.
//

import SwiftUI

struct RecipeBadgeView: View {
    var recipe: Recipe = Recipe.mock
    var body: some View {
        HStack {
            Text(recipe.getCuisineType())
                .lineLimit(1)
                .font(.caption)
                .padding(3)
                .overlay(Capsule().stroke(.green, lineWidth: 1))
                .frame(minWidth: 25)
            Text(recipe.getMealType())
                .lineLimit(1)
                .font(.caption)
                .padding(3)
                .overlay(Capsule().stroke(.orange, lineWidth: 1))
                .frame(minWidth: 25)
            Text(recipe.getDishType())
                .lineLimit(1)
                .font(.caption)
                .padding(3)
                .overlay(Capsule().stroke(.blue, lineWidth: 1))
                .frame(minWidth: 25)
            
            Spacer()
        }
    }
}

struct RecipeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBadgeView()
    }
}
