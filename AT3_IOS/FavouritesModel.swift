//
//  FavouritesModel.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//

import Foundation
// model to add users favourite restaurants to list

class FavouritesModel: ObservableObject {
    @Published var favouriteRestaurants: [String] = [] //Store placeIDs
    
    func addFavourite(name: String) {
        if !favouriteRestaurants.contains(name) {
            favouriteRestaurants.append(name)
        }
    }
    
    func removeFavourite(name: String) {
        favouriteRestaurants.removeAll { $0 == name }
    }
}

