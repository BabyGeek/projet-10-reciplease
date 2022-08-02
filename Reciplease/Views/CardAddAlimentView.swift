//
//  CardAddAlimentView.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

struct CardAddAlimentView: View {
    @State var ingredient = ""
    
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
                    
                    Button {
                        print("add ingredient")
                    } label: {
                        Text("Add")
                    }
                    .clipShape(Capsule())
                    .buttonStyle(.borderedProminent)
                    .tint(Color("Primary"))
                    .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CardAddAlimentView_Previews: PreviewProvider {
    static var previews: some View {
        CardAddAlimentView()
    }
}
