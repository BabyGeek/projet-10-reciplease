//
//  RecipeInstructionButtonView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SafariServices
import SwiftUI

struct RecipeInstructionButtonView: View {
    @Environment(\.openURL) var openURL
    @State var showSafari: Bool = false
    
    var recipe: Recipe = Recipe.mock

    var body: some View {
        Button(action: {
            showSafari = true
        }, label: {
            Text("Show instructions")
        })
        .clipShape(Capsule())
        .buttonStyle(.borderedProminent)
        .tint(Color("Primary"))
        .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
        .sheet(isPresented: $showSafari) {
            if let url = URL(string: recipe.url) {
                SafariView(url: url)
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

struct RecipeInstructionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInstructionButtonView()
    }
}
