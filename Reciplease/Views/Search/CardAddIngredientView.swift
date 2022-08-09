//
//  CardAddAlimentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import RealmSwift
import SwiftUI

struct CardAddIngredientView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    @ObservedResults(IngredientEntity.self) var ingredients
    @State var ingredient = ""
    @FocusState var focusing
    
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(Color("CardBackground").opacity(0.5))
            .shadow(color: Color("Primary"), radius: 15, x: 0, y: 5)
            .overlay(
                VStack {
                    Text("What's in your fridge?")
                        .font(.largeTitle)
                        .frame(alignment: .center)
                        .accessibilityLabel("What's in your fridge?")
                        .accessibilityHint("Tell us what is in your fridge.")
                    
                    HStack {
                        TextField("Add ingredients like eggs, avocado, ...", text: $ingredient)
                            .font(.body)
                            .focused($focusing)
                            .submitLabel(.done)
                            .textFieldStyle(.roundedBorder)
                            .accessibilityLabel("Your ingredients to add")
                            .accessibilityHint("Type your ingredients names in the text field.")
                        
                        Button {
                            if viewModel.isValidIngredient(ingredient) {
                                let ingredientEntity = IngredientEntity()
                                ingredientEntity.name = self.ingredient
                                $ingredients.append(ingredientEntity)
                            }
                            self.ingredient = ""
                        } label: {
                            Text("Add")
                                .font(.body)
                                .accessibilityHint("Add an ingredient to your list.")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("Primary"))
                        .frame(height: 50)
                    }
                    .onSubmit {
                        focusing = false
                    }
                    .padding(.horizontal)
                }
            )
    }
}

struct CardAddAlimentView_Previews: PreviewProvider {
    static var previews: some View {
        CardAddIngredientView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
