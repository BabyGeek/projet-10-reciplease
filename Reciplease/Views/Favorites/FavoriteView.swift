//
//  FavoriteView.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        ScrollView {
            FavoriteListView()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
