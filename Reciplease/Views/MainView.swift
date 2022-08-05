//
//  MainView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var searchViewModel = SearchViewModel(service: SearchService())
    
    var body: some View {
        TabView {
            NavigationView {
                SearchView()
                    .navigationTitle("Reciplease")
            }
            .environmentObject(searchViewModel)
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
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
