//
//  MainView.swift
//  Reciplease
//
//  Created by Paul Oggero on 03/08/2022.
//

import RealmSwift
import SwiftUI

struct MainView: View {
    @ObservedResults(RecipeEntity.self) var favorites
    @StateObject var recipeViewModel = RecipeViewModel(service: SearchService())
    
    var body: some View {
        TabView {
            NavigationView {
                SearchView()
                    .navigationTitle("Reciplease")
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
            .badge(favorites.count)
            
        }
        .environmentObject(recipeViewModel)
        .alert(item: $recipeViewModel.error) { error in
            return Alert(
                title: Text("Error"),
                message: Text(error.getDescription())
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(recipeViewModel: RecipeViewModel(service: SearchMockService()))
    }
}
