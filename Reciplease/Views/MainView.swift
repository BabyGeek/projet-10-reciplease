//
//  MainView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContentView()         .navigationTitle("Reciplease")
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            
            NavigationView {
                FavoriteView()
                    .navigationTitle("Favorites")
            }
            .navigationViewStyle(.stack)
            .tabItem {
                Label("Favorites", systemImage: "heart")
            }
//            NavigationView {
//                ContentView()
//                    .navigationTitle("Reciplease")
//            }
//            .preferredColorScheme(.dark)
//            .tabItem {
//                Label("Search", systemImage: "magnifyingglass")
//            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
