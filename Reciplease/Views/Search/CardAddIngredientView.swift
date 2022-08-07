//
//  CardAddAlimentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import RealmSwift
import SwiftUI

struct CardAddIngredientView: View {
    @ObservedResults(IngredientEntity.self) var ingredients
    @State var ingredient = ""
    @FocusState var focusing
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .fill(Color("CardBackground").opacity(0.38))
                .shadow(color: Color("CardBackground"), radius: 50, x: 3, y: 5)
                .frame(minHeight: 150)

            VStack {
                Text("What's in your fridge?")
                    .font(.title)
                    .frame(alignment: .center)
                    .lineLimit(1)
                    .accessibilityLabel("What's in your fridge?")
                
                HStack {
                    TextField("Lemon, Cheese, Sausages...", text: $ingredient)
                        .font(.body)
                        .focused($focusing)
                        .submitLabel(.done)
                        .accessibilityLabel("Ingredients to add")
                    
                    Button {
                            let ingredientEntity = IngredientEntity()
                            ingredientEntity.name = self.ingredient
                            $ingredients.append(ingredientEntity)
                            
                            self.ingredient = ""
                    } label: {
                        Text("Add")
                            .font(.body)
                            .accessibilityLabel("Add an ingredient to your list.")
                    }
                    .clipShape(Capsule())
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Primary"))
                }
                .onSubmit {
                    focusing = false
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CardAddAlimentView_Previews: PreviewProvider {
    static var previews: some View {
        CardAddIngredientView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
