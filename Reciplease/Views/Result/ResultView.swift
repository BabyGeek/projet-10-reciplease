//
//  ResultView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        if viewModel.isLoading || (viewModel.results.isEmpty && viewModel.totalResults == nil) {
            VStack {
                ProgressView()
                Text("Loading")
            }
        } else {
            if viewModel.totalResults == 0 {
                VStack(alignment: .center) {
                    Spacer()
                    Text("No result found for your ingredients.")
                    Spacer()
                }
            } else {
                ScrollView {
                    ResultListView(recipes: viewModel.results)
                        .accessibilityHidden(true)
                }
                .listRowSeparatorTint(.black, edges: .all)
                .accessibilityLabel("List of recipes results.")
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(RecipeViewModel(service: SearchMockService()))
            .preferredColorScheme(.dark)
    }
}
