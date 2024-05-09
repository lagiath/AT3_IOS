//
//  PlacesListView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 9/5/2024.
//

import SwiftUI

struct PlacesListView: View {
    @State var places: [Place] = []  // Changed to [Place]
    var searchTerm: String
    
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
            }
            .navigationTitle("Search Results")
            .onAppear {
                loadPlaces()
            }
        }
    }

    func loadPlaces() {
        PlaceSearchManager().searchPlaces(searchText: searchTerm) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let places):
                    self.places = places  // Ensure that fetchedPlaces is [Place]
                case .failure(let error):
                    print("Error fetching places: \(error)")
                }
            }
        }
    }
}
#Preview {
    PlacesListView(places: [], searchTerm: "")
}
