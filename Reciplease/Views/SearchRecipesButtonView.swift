//
//  SearchRecipesButtonView.swift
//  Reciplease
//
//  Created by Paul Oggero on 01/08/2022.
//

import SwiftUI

struct SearchRecipesButtonView: View {
    var body: some View {
        Button {
            print("Search")
        } label: {
            Text("Search for recipes")
        }
        .tint(Color("Primary"))
        .buttonStyle(.borderedProminent)
        .clipShape(Capsule())
        .shadow(color: Color("Primary"), radius: 50, x: 3, y: 5)
        .padding(.bottom)
    }
}

struct SearchRecipesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipesButtonView()
    }
}
