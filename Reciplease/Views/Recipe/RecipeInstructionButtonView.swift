//
//  RecipeInstructionButtonView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SwiftUI

struct RecipeInstructionButtonView: View {
    @State var selection: String? = nil
    var recipe: Recipe = Recipe.mock

    var body: some View {
        NavigationLink(destination: InstructionView(), tag: "instruction", selection: $selection) {
            EmptyView()
        }
        
        Button(action: {
            self.selection = "instruction"
        }, label: {
            Text("Show instructions")
        })
        .clipShape(Capsule())
        .buttonStyle(.borderedProminent)
        .tint(Color("Primary"))
        .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
    }
}

struct RecipeInstructionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInstructionButtonView()
    }
}
