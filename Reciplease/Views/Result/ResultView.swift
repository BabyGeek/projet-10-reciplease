//
//  ResultView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ResultListView(recipes: viewModel.results)
        })
        .navigationTitle("Results")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .preferredColorScheme(.dark)
    }
}
