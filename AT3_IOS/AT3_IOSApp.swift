//
//  AT3_IOSApp.swift
//  AT3_IOS
//
//  Created by Daniel Gabb on 6/5/2024.
//

import SwiftUI
import GooglePlaces

@main
struct AT3_IOSApp: App {
    let favouritesModel = FavouritesModel()
    // Paste the API key that I sent in the group chat here or the app wont function at all
    init() {
        GMSPlacesClient.provideAPIKey("")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favouritesModel)
        }
    }
}
