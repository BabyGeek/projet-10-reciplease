//
//  ResultView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ResultListView()
            }
            .navigationTitle("Reciplease")
            .modifier(CustomViewBackground())
        }
        .padding(.horizontal)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .preferredColorScheme(.dark)
    }
}
