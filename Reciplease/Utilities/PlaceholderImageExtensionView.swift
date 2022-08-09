//
//  PlaceholderImageExtensionView.swift
//  Reciplease
//
//  Created by Paul Oggero on 06/08/2022.
//

import SwiftUI

extension View {
    @ViewBuilder
    /// Custom placeholder image
    /// - Returns: Return photo Image view
    func placeholderImage() -> some View {
        Image(systemName: "photo")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
    }
}
