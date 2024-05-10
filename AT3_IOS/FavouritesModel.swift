//
//  FavouritesModel.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//

import Foundation

class FavouritesModel: ObservableObject {
    @Published var favouriteRestaurants: [Place] = []
    
    // adds favourite restaurants to the list
    func addFavourite(place: Place) {
        if !favouriteRestaurants.contains(where: { $0.id == place.id }) {
            favouriteRestaurants.append(place)
        }
    }
    // removes them
    func removeFavourite(placeId: String) {
        favouriteRestaurants.removeAll { $0.id == placeId }
    }
}

