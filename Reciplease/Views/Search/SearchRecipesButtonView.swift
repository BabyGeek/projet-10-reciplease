//
//  SearchRecipesButtonView.swift
//  Reciplease
//
//  Created by Paul Oggero on 01/08/2022.
//

import SwiftUI

struct SearchRecipesButtonView: View {
    @State var selection: String? = nil
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        NavigationLink(destination: ResultView(), tag: "result", selection: $selection) {
            EmptyView()
        }
        
        Button(action: {
            self.selection = "result"
            viewModel.fetchData()
        }, label: {
            Text("Search for recipes")
        })
        .clipShape(Capsule())
        .buttonStyle(.borderedProminent)
        .tint(Color("Primary"))
        .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
    }
}

struct SearchRecipesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchRecipesButtonView()
            .preferredColorScheme(.dark)
            .environmentObject(SearchViewModel(service: SearchMockService()))
    }
}
