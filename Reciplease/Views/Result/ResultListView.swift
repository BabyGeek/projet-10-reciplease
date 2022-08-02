//
//  ResultListView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct ResultListView: View {
    var recipes = [
        Recipe.mock,
        Recipe.mock,
        Recipe.mock,
        Recipe.mock
    ]
    
    @State var selection: Int? = -1
    
    var body: some View {
        List(recipes.indices, id: \.self) { index in
            let recipe = recipes[index]
            NavigationLink(destination: RecipeView(recipe: recipe), tag: index, selection: $selection) {
                RecipeListView(recipe: recipe)
            }
        }
        .listStyle(.plain)
    }
}

struct ResultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
    }
}