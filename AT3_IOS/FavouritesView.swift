//
//  FavouritesView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//
import SwiftUI

struct FavouritesView: View {
    @EnvironmentObject var favouritesModel: FavouritesModel

    var body: some View {
        NavigationView {
            // This is the list of favourite restaurants
            List(favouritesModel.favouriteRestaurants, id: \.id) { place in
                NavigationLink(destination: PlaceDetailView(place: place)) {
                    VStack(alignment: .leading) {
                        Text(place.name).font(.headline)
                        Text(place.address).font(.subheadline)
                    }
                }
            }
            .navigationTitle("Favourite Restaurants")
            .toolbar {
                EditButton()
            }
        }
    }

    // Theres a button in the top right corner so you can remove favourites directly from the view 
    private func deleteItems(at offsets: IndexSet) {
        offsets.forEach { index in
            let restaurantID = favouritesModel.favouriteRestaurants[index].id
            favouritesModel.removeFavourite(placeId: restaurantID)
        }
    }
}
