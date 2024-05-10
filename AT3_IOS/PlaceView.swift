//
//  PlaceView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//
import SwiftUI

struct PlaceView: View {
    let place: Place

    var body: some View {
        // This is the list of places that come up just before you tap and can go into the detailed view
        VStack(alignment: .leading) {
            Text(place.name).font(.headline)
            Text(place.address).font(.subheadline)
            Text("Rating: \(place.rating, specifier: "%.1f")/5")
            if let phone = place.phoneNumber, !phone.isEmpty {
                Text("Phone: \(phone)")
            }
            if let hours = place.openingHours?.joined(separator: ", ") {
                Text("Hours: \(hours)")
            }
            if let website = place.website {
                Link("Website", destination: website)
            }
        }
    }
}
