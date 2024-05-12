//
//  PlacesListView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//
import SwiftUI

struct PlacesListView: View {

    var places: [Place]
    @State private var selectedPlace: Place? = nil


    var body: some View {
        // Takes you to the detailed page with all the information and photos
        List(places, id: \.id) { place in
            NavigationLink(destination: PlaceDetailView(place: place)) {
                Text(place.name)
            }
        }
    }
}
