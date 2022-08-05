//
//  ContentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    @State var ingredient = ""
    
    var body: some View {
        VStack {
            CardAddIngredientView()
            
            if !viewModel.ingredients.isEmpty {
                VStack {
                    CardListIngredientsView()
                    Spacer()
                    SearchRecipesButtonView()
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
