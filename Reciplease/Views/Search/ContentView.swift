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
        NavigationView {
            VStack(spacing: 20) {
                CardAddAlimentView()

                CardListIngredientsView()

                Spacer()
                SearchRecipesButtonView()
            }
            .navigationTitle("Reciplease")
            .modifier(CustomViewBackground())
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
