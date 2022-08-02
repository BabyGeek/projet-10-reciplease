//
//  RecipleaseApp.swift
//  Reciplease
//
//  Created by Paul Oggero on 31/07/2022.
//

import SwiftUI

@main
struct RecipleaseApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .preferredColorScheme(.dark)
                    .modifier(CustomViewBackground())
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                
            }
        }
    }
}
