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
    
    var body: some View {
        List(recipes) { recipe in
                RecipeView(recipe: recipe)
            }
    }
}

struct ResultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
    }
}
