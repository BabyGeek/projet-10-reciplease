//
//  CardListIngredientsView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import RealmSwift
import SwiftUI

struct CardListIngredientsView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    @ObservedResults(IngredientEntity.self) var ingredients
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Ingredients")
                    .font(.title3)
                    .foregroundColor(Color("Text"))
                    .lineLimit(1)
                    .accessibilityLabel("Ingredients")
                Spacer()
                Button {
                    viewModel.cleanIngredients()
                } label: {
                    Text("Clear")
                        .font(.body)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Red"))
                .clipShape(Capsule())
                .shadow(color: Color("Red"), radius: 25, x: 3, y: 5)
            }
            
            ForEach(ingredients, id: \.id) { ingredient in
                Text("- \(ingredient.name)")
                    .foregroundColor(Color("Text"))
                    .font(.body)
            }
        }
    }
}

struct CardListIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        CardListIngredientsView()
            .environmentObject(RecipeViewModel(service: SearchMockService()))
    }
}
