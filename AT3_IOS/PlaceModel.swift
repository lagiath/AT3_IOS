//
//  PlaceModel.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 9/5/2024.
//

import Foundation
import CoreLocation
import GooglePlaces

struct Place: Identifiable {
    let id: String  // Unique identifier for SwiftUI lists
    let name: String
    let address: String
    let rating: Float
    let latitude: Double
    let longitude: Double
    let isOpen: GMSPlaceOpenStatus

    init(from gmsPlace: GMSPlace) {
        self.id = gmsPlace.placeID ?? "Unknown ID"
        self.name = gmsPlace.name ?? "Unknown"
        self.address = gmsPlace.formattedAddress ?? "Uknown Address"
        self.rating = gmsPlace.rating
        self.latitude = gmsPlace.coordinate.latitude
        self.longitude = gmsPlace.coordinate.longitude
        self.isOpen = gmsPlace.isOpen()
    }
}
