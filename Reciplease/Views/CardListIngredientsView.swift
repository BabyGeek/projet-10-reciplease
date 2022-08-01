//
//  CardListIngredientsView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

struct CardListIngredientsView: View {
    var ingredients = [
        Ingredient(name: "Egg"),
        Ingredient(name: "Tomato"),
        Ingredient(name: "Avocado"),
    ]
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Ingredients :")
                    .font(.title3)
                Spacer()
                Button {
                    print("add ingredient")
                } label: {
                    Text("Clear")
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .clipShape(Capsule())
            }
            
            VStack {
                
                ForEach(ingredients) { ingredient in
                    HStack {
                        Text("\t -  \(ingredient.name)")
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CardListIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        CardListIngredientsView()
    }
}
