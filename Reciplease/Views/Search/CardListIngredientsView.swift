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
                    .accessibilityHint("Ingredients added in your list.")
                Spacer()
                Button {
                    let realm = try! Realm()
                    
                    try! realm.write {
                        let allIngredients = realm.objects(IngredientEntity.self)
                        realm.delete(allIngredients)
                    }
                } label: {
                    Text("Clear")
                        .font(.body)
                        .accessibilityHint("Clear the list of ingredients.")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Red"))
                .shadow(color: Color("Red"), radius: 25, x: 3, y: 5)
            }
            
            ForEach(ingredients, id: \.id) { ingredient in
                Text("- \(ingredient.name)")
                    .foregroundColor(Color("Text"))
                    .font(.body)
                    .accessibilityLabel("Ingredient \(ingredient.name)")
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
