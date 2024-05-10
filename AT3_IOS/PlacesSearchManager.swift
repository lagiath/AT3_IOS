//
//  PlacesSearchManager.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//

import Foundation
import GooglePlaces

// This is the API fetching logic using the SDK
class PlacesSearchManager: ObservableObject {
    @Published var places: [Place] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func performSearch(with searchText: String) {
        guard !searchText.isEmpty else {
            self.places = []
            self.errorMessage = "Search query cannot be empty."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let placeProperties: [String] = [
            GMSPlaceProperty.name.rawValue,
            GMSPlaceProperty.placeID.rawValue,
            GMSPlaceProperty.photos.rawValue,
            GMSPlaceProperty.formattedAddress.rawValue,
            GMSPlaceProperty.rating.rawValue,
            GMSPlaceProperty.openingHours.rawValue,
            GMSPlaceProperty.website.rawValue
        ]
        
        let request = GMSPlaceSearchByTextRequest(textQuery: searchText, placeProperties: placeProperties)
        request.isOpenNow = true
        request.includedType = "restaurant"
        request.maxResultCount = 5
        request.minRating = 3.5
        
        GMSPlacesClient.shared().searchByText(with: request) { [weak self] results, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = "Failed to fetch places: \(error.localizedDescription)"
                    return
                }
                // This maps the fetched results into a seperate Observable Object so it's easier to use in the rest of the app
                if let results = results {
                    self?.places = results.map { Place(from: $0) }
                }
            }
        }
    }
}


