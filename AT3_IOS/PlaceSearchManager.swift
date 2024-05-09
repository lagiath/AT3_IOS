//
//  RestaurantManager.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//

import Foundation
import GooglePlaces

class PlaceSearchManager: NSObject {
    static let shared = PlaceSearchManager()
    private let placesClient = GMSPlacesClient.shared()

    func searchPlaces(searchText: String, completion: @escaping (Result<[Place], Error>) -> Void) {
        let placeProperties: [String] = [
            GMSPlaceProperty.name.rawValue,
            GMSPlaceProperty.placeID.rawValue,
            GMSPlaceProperty.photos.rawValue,
            GMSPlaceProperty.formattedAddress.rawValue,
            GMSPlaceProperty.rating.rawValue,
            GMSPlaceProperty.openingHours.rawValue,
            GMSPlaceProperty.website.rawValue
        ]

        let request = GMSPlaceSearchByTextRequest(
            textQuery: searchText,
            placeProperties: placeProperties
        )

        
        // Define the callback
        let callback: GMSPlaceSearchByTextResultCallback = { [weak self] results, error in
            guard let self = self else { return }
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            guard let placeResults = results else {
                completion(.failure(NSError(domain: "NoPlacesFound", code: 0, userInfo: [NSLocalizedDescriptionKey: "No results found"])))
                return
            }
            
            // Map GMSPlace to Place model
            let places = placeResults.map { Place(from: $0) }
            completion(.success(places))
        }
        
        // Perform the search by text request
        placesClient.searchByText(with: request, callback: callback)
    }
}
