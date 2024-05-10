//
//  PlacesListView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//
import SwiftUI

struct PlacesListView: View {

    var places: [Place]

    @State var places: [Place] = []
    var searchTerm: String
    @State private var selectedPlace: Place? = nil
    
    var body: some View {
        NavigationView {
            List(places, id: \.id) { place in
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.headline)
                    Text(place.address)
                        .font(.subheadline)
                    Text("Rating: \(place.rating)/5")
                }
                .onTapGesture {
                    selectedPlace = place
                }
            }
            .navigationTitle("Search Results")
            .sheet(item: $selectedPlace) { place in
                RestaurantDetailView(restaurant: place)
            }
            .onAppear {
                loadPlaces()
            }
        }
    }


    var body: some View {
        // Takes you to the detailed page with all the information and photos
        List(places, id: \.id) { place in
            NavigationLink(destination: PlaceDetailView(place: place)) {
                Text(place.name)
            }
        }
    }
}
