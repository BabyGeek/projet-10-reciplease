//
//  RecipeBadgeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 08/08/2022.
//

import SwiftUI

struct RecipeBadgeView: View {
    var recipe: Recipe = Recipe.mock
    var padding: CGFloat = 4
    var font: Font = .body
    var isAccessibilityElement: Bool = false
    
    var body: some View {
        HStack {
            Text(recipe.getCuisineType())
                .lineLimit(1)
                .font(font)
                .frame(maxWidth: UIScreen.main.bounds.size.width / 3)
                .padding(padding)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.blue, lineWidth: 1))
                .accessibilityLabel("\(recipe.getCuisineType()) cuisine")
            
            Text(recipe.getMealType())
                .lineLimit(1)
                .font(font)
                .frame(maxWidth: UIScreen.main.bounds.size.width / 3)
                .padding(padding)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.green, lineWidth: 1))
                .accessibilityLabel("\(recipe.getMealType()) meal")
            
            Text(recipe.getDishType())
                .lineLimit(1)
                .font(font)
                .frame(maxWidth: UIScreen.main.bounds.size.width / 3)
                .padding(padding)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(.orange, lineWidth: 1))
                .accessibilityLabel("\(recipe.getDishType()) dish")
        }
    }
}

struct RecipeBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeBadgeView()
    }
}
