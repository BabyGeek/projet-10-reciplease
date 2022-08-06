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
                .frame(height: 150)

            VStack {
                Text("What's in your fridge?")
                    .foregroundColor(Color("Text"))
                    .font(.title)
                    .frame(alignment: .center)
                
                HStack {
                    TextField("Lemon, Cheese, Sausages...", text: $ingredient)
                        .foregroundColor(Color("Text").opacity(0.8))
                        .focused($focusing)
                        .submitLabel(.done)
                    
                    Button {
                            let ingredientEntity = IngredientEntity()
                            ingredientEntity.name = self.ingredient
                            $ingredients.append(ingredientEntity)
                            
                            self.ingredient = ""
                    } label: {
                        Text("Add")
                    }
                    .clipShape(Capsule())
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Primary"))
                    .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
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
    }
}
