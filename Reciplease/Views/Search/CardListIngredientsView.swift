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
        VStack {
            HStack {
                Text("Ingredients :")
                    .font(.title3)
                    .foregroundColor(Color("Text"))
                Spacer()
                Button {
                    viewModel.cleanIngredients()
                } label: {
                    Text("Clear")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Red"))
                .clipShape(Capsule())
                .shadow(color: Color("Red"), radius: 25, x: 3, y: 5)
            }
            
            VStack {
                List {
                    ForEach(ingredients, id: \.id) { ingredient in
                        VStack(alignment: .leading) {
                            Text("- \(ingredient.name)")
                                .foregroundColor(Color("Text"))
                        }
                    }
                    .onDelete(perform: $ingredients.remove)
                }
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
