//
//  PlaceModel.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 9/5/2024.
//

import Foundation
import CoreLocation
import GooglePlaces

struct Review: Identifiable, Codable {
    let id: UUID = UUID()
    let reviewerName: String
    let rating: Int
    let comment: String
}
// This is the details of the fetched data from the API with all the place details so it can be used elsewhere
class Place: Identifiable, ObservableObject, Equatable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }

    let id: String
    @Published var name: String
    @Published var address: String
    @Published var rating: Float
    @Published var phoneNumber: String?
    @Published var openingHours: [String]?
    @Published var website: URL?
    @Published var photos: GMSPlacePhotoMetadata?
    @Published var reviews: [Review] = []

    var appRating: Double {
        reviews.isEmpty ? 0 : Double(reviews.map { $0.rating }.reduce(0, +)) / Double(reviews.count)
    }

    init(from gmsPlace: GMSPlace) {
        self.id = gmsPlace.placeID ?? "Unknown ID"
        self.name = gmsPlace.name ?? "Unknown"
        self.address = gmsPlace.formattedAddress ?? "Unknown Address"
        self.rating = gmsPlace.rating
        self.phoneNumber = gmsPlace.phoneNumber
        self.openingHours = gmsPlace.openingHours?.weekdayText
        self.website = gmsPlace.website
        self.photos = gmsPlace.photos?.first
    }

    func addReview(_ review: Review) {
        DispatchQueue.main.async {
            self.reviews.append(review)
        }
    }
}
