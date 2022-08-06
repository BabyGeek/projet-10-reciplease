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
            .listRowBackground(
                AsyncImage(url: URL(string: recipe.image), content: {
                    image in
                    image
                        .resizable()
                        .mask(
                            LinearGradient(gradient: Gradient(
                                colors: [
                                    .clear,
                                    .black,
                                    .black,
                                    .black,
                                    .clear]
                            ),
                                           startPoint: .bottom,
                                           endPoint: .top)
                        )
                }, placeholder: {
                    ProgressView()
                }))
            .frame(height: 170)
        }
    }
}

struct ResultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
            .preferredColorScheme(.dark)
    }
}
