//
//  RestaurantData.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//

import Foundation

struct RestaurantData: Codable {
    var name: String
    var address: String
    var rating: Double
    var openingHours: OpeningHours?
    
    enum CodingKeys: String, CodingKey {
        case name, rating
        case address = "formatted_address"
        case openingHours = "opening_hours"
    }
}

struct OpeningHours: Codable {
    var openNow: Bool
    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}
