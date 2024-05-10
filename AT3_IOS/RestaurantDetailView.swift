//
//  RestaurantDetailView.swift
//  AT3_IOS
//
//  Created by Daniel Gabb on 10/5/2024.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Place

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(restaurant.name)
                .font(.title)

            Text(restaurant.address)
                .font(.subheadline)

            Text("Rating: \(restaurant.rating)/5")
                .font(.subheadline)

            // Add more details as needed

            Spacer()
        }
        .padding()
        .navigationTitle("Restaurant Details")
    }
}

