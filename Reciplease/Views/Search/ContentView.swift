//
//  ContentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var ingredient = ""
    
    var body: some View {
        VStack(spacing: 20) {
            CardAddIngredientView()
            
            CardListIngredientsView()
            
            Spacer()
            SearchRecipesButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
