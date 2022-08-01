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
            VStack {
                CardAddAlimentView()
                CardListIngredientsView()
                Spacer()
                Button {
                    print("Search")
                } label: {
                    Text("Search for recipes")
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                }
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
                .padding(.bottom)

            }
            .padding(.horizontal)
            .navigationTitle("Reciplease")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
