//
//  PlaceDetailView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//

import SwiftUI

struct PlaceDetailView: View {
    @ObservedObject var place: Place
    @State private var localPlace: Place
    @EnvironmentObject var favouritesModel: FavouritesModel
    @State private var showingReviewForm = false
    
    init(place: Place) {
        self.place = place
        _localPlace = State(initialValue: place)
    }

    var body: some View {
        ScrollView {
            // Has all the information for each place, the variable names should be self explanatory
            VStack(alignment: .leading, spacing: 20) {
                Text(place.name)
                    .font(.largeTitle)
                    .bold()
                Text(place.address)
                    .font(.title2)

                if let phone = place.phoneNumber {
                    Text("Phone: \(phone)")
                }

                if let hours = place.openingHours?.joined(separator: "\n") {
                    Text("Opening Hours:\n\(hours)")
                }

                if let website = place.website {
                    Link("Visit Website", destination: website)
                }
                
                Text("Google Rating: \(place.rating, specifier: "%.1f")/5")
                
                Text("App Name Reviews: \(place.appRating, specifier: "%.1f")/5")
                
                // This shows the reviews that have been left in the app and they're available int this view
                ForEach(place.reviews) { review in
                    VStack(alignment: .leading) {
                        Text(review.reviewerName).font(.headline)
                        Text("\(review.rating) Stars").font(.subheadline)
                        Text(review.comment).italic()
                    }
                    .padding()
                }
                
                Button("Add Review") {
                    showingReviewForm = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button(action: {
                    favouritesModel.addFavourite(place: place)
                }) {
                    Text("Add to Favourites")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                if let photoMetadata = place.photos {
                    PlacePhotoView(photoMetadata: photoMetadata)
                }

                Spacer()
            }
            .padding()
            // This sheet brings up the "leave a review sheet"
            .sheet(isPresented: $showingReviewForm) {
                ReviewFormView(place: $localPlace) {
                    showingReviewForm = false
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
