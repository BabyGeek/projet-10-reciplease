//
//  CardListIngredientsView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

struct CardListIngredientsView: View {
    @EnvironmentObject var viewModel: SearchViewModel
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
                    .foregroundColor(Color("Text"))
                Spacer()
                Button {
                    print("clear ingredients")
                } label: {
                    Text("Clear")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("Red"))
                .clipShape(Capsule())
                .shadow(color: Color("Red"), radius: 25, x: 3, y: 5)
            }
            
            VStack {
                ForEach(ingredients) { ingredient in
                    HStack {
                        Text("\t -  \(ingredient.name)")
                            .foregroundColor(Color("Text"))
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
