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

    init() {
        GMSPlacesClient.provideAPIKey("")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
