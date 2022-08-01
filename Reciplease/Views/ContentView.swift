//
//  ContentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var ingredient = "Add ingredient"
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Ingredient", text: $ingredient)
                    
                    Button {
                        print("add ingredient")
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.bordered)
                    .tint(.green)
                    .clipShape(Capsule())

                }
                .padding()
                    .navigationTitle("Reciplease")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
