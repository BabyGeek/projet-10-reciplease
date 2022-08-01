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
                .fill(.red)
            VStack {
                Text("What's in your fridge?")
                    .font(.title)
                    .frame(alignment: .center)
                
                HStack {
                    TextField("Lemon, Cheese, Sausages...", text: $ingredient)
                    
                    Button {
                        print("add ingredient")
                    } label: {
                        Text("Add")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 150)
    }
}

struct CardAddAlimentView_Previews: PreviewProvider {
    static var previews: some View {
        CardAddAlimentView()
    }
}
