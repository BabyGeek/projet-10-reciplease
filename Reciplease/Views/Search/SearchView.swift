//
//  ContentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import RealmSwift
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    @ObservedResults(IngredientEntity.self) var ingredients
    
    var body: some View {
        VStack {
            CardAddIngredientView()
                .frame(maxHeight: UIScreen.main.bounds.size.height / 4.5)
                .padding(.horizontal)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
            Spacer()
            
            if !ingredients.isEmpty {
                VStack {
                    ScrollView {
                        CardListIngredientsView()
                    }
                    Spacer()
                    SearchRecipesButtonView()
                }
                .animation(.easeInOut, value: viewModel.ingredients.isEmpty)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
            .environmentObject(RecipeViewModel(service: SearchMockService()))
    }
}
