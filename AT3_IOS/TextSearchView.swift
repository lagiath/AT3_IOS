//
//  RestaurantManager.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//
import SwiftUI


struct TextSearchView: View {
    @StateObject private var searchManager = PlacesSearchManager()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a Restaurant Name or Cuisine Type", text: $searchText, onCommit: {
                    searchManager.performSearch(with: searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                if searchManager.isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = searchManager.errorMessage, !errorMessage.isEmpty {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    PlacesListView(places: searchManager.places)
                }
            }
            .navigationBarTitle("Search for Food")
        }
    }
}

#Preview {
    TextSearchView()
}
