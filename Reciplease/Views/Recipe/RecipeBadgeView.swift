//
//  RecipeBadgeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 08/08/2022.
//

import SwiftUI

struct RecipeBadgeView: View {
    var recipe: Recipe = Recipe.mock
    var isAccessibilityElement: Bool = false
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(.orange, lineWidth: 1)
                .frame(maxWidth: UIScreen.main.bounds.size.width / 3, maxHeight: 15)
                .overlay(
                    Text(recipe.getCuisineType())
                        .lineLimit(1)
                        .font(.caption))
                .padding(3)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(.green, lineWidth: 1)
                .frame(maxWidth: UIScreen.main.bounds.size.width / 3, maxHeight: 15)
                .overlay(
                    Text(recipe.getMealType())
                        .lineLimit(1)
                        .font(.caption))
                .padding(3)
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(.blue, lineWidth: 1)
                .frame(maxWidth: UIScreen.main.bounds.size.width / 3, maxHeight: 15)
                .overlay(
                    Text(recipe.getDishType())
                        .lineLimit(1)
                        .font(.caption))
                .padding(3)
            
            Spacer()
        }
    }
}

struct RecipeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBadgeView()
    }
}
