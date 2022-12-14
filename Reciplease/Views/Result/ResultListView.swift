//
//  ResultListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct ResultListView: View {
    var recipes: [Recipe] = []
    
    @State var selection: Int? = -1
    
    var body: some View {
        ForEach(recipes.indices, id: \.self) { index in
            let recipe = recipes[index]
            NavigationLink(destination: RecipeView(recipe: recipe), tag: index, selection: $selection) {
                RecipeRowView(recipe: recipe)
            }
            .accessibilityLabel("\(recipe.label), takes \(recipe.getTime()) to prepare, has \(recipe.getCalories()) calories, \(recipe.getCuisineType()) cuisine, best for \(recipe.getMealType()), \(recipe.getDishType()) dish. Click to show ingredients and instructions.")
        }
    }
}

struct ResultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
            .preferredColorScheme(.dark)
    }
}
