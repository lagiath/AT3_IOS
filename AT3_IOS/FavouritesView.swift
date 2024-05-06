//
//  FavouritesView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var favouritesModel: FavouritesModel //contains fav restaurants

    var body: some View {
        NavigationView {
            List {
                ForEach(favouritesModel.favouriteRestaurants, id: \.self) { restaurant in
                    Text(restaurant)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Favorite Restaurants")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let restaurantID = favouritesModel.favouriteRestaurants[index]
            favouritesModel.removeFavourite(name: restaurantID)
        }
    }
    
}

#Preview {
    FavouritesView(favouritesModel: FavouritesModel())
}
