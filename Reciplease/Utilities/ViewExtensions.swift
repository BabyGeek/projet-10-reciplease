//
//  ViewExtensions.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct CustomViewBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()

            content
        }
    }
}
