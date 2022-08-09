//
//  SearchRecipesButtonView.swift
//  Reciplease
//
//  Created by Paul Oggero on 01/08/2022.
//

import RealmSwift
import SwiftUI

struct SearchRecipesButtonView: View {
    @State var selection: String? = nil
    @EnvironmentObject var viewModel: RecipeViewModel
    @ObservedResults(IngredientEntity.self) var ingredients
    
    var body: some View {
        NavigationLink(
            destination: ResultView()
                .navigationTitle("Results")
                .navigationBarTitleDisplayMode(.inline),
            tag: "result",
            selection: $selection) {
                EmptyView()
            }
            .accessibilityHidden(true)
        
        Button(action: {
            if canSearch() {
                self.selection = "result"
                viewModel.fetchData(getIngredients())
            }
        }, label: {
            Text("Search for recipes")
                .font(.body)
                .accessibilityHint("Click to search recipes with your ingredients")
        })
        .buttonStyle(.borderedProminent)
        .tint(Color("Primary"))
        .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
        .lineLimit(1)
    }
    
    func canSearch() -> Bool {
        if ingredients.isEmpty {
            viewModel.error = AppError(error: CRUDError.emptyIngredient)
            return false
        }
        return true
    }
    
    func getIngredients() -> [Ingredient] {
        var ingredients = [Ingredient]()
        
        for ingredient in self.ingredients {
            ingredients.append(ingredient.toModel())
        }
        
        return ingredients
    }
}

struct SearchRecipesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipesButtonView()
            .environmentObject(RecipeViewModel(service: SearchMockService()))
    }
}
