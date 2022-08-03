//
//  RecipeInstructionButtonView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SwiftUI

struct RecipeInstructionButtonView: View {
    @Environment(\.openURL) var openURL
    var recipe: Recipe = Recipe.mock

    var body: some View {
        Button(action: {
            if let url = URL(string: recipe.url) {
                openURL(url)
            }
        }, label: {
            Text("Show instructions")
        })
        .clipShape(Capsule())
        .buttonStyle(.borderedProminent)
        .tint(Color("Primary"))
        .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
    }
}

struct RecipeInstructionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInstructionButtonView()
    }
}
