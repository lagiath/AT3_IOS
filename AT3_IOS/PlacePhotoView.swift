//
//  PlacePhotoView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//

import SwiftUI
import GooglePlaces

// This is just logic to process the images so they can be displayed in the detailed view
struct PlacePhotoView: View {
    let photoMetadata: GMSPlacePhotoMetadata
    @State private var image: UIImage?

    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image).resizable().scaledToFit()
            } else {
                Text("Loading Image...").onAppear(perform: loadImage)
            }
        }
    }

    private func loadImage() {
        GMSPlacesClient.shared().loadPlacePhoto(photoMetadata, callback: { (photo, error) in
            DispatchQueue.main.async {
                if let photo = photo {
                    self.image = photo
                } else if let error = error {
                    print("Error loading photo: \(error.localizedDescription)")
                }
            }
        })
    }
}
