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
                    .background(
                        AsyncImage(url: URL(string: recipe.imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 120)
                                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear]), startPoint: .top, endPoint: .bottom))
                        } placeholder: {
                            ProgressView()
                        }
                    )
                    .padding(.bottom)
            }
        }
        .listStyle(.inset)
    }
}

struct ResultScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ResultListView()
    }
}
