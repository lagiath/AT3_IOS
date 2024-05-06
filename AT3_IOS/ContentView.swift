//
//  ContentView.swift
//  AT3_IOS
//
//  Created by Daniel Gabb on 6/5/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("App Name Goes Here")
                .font(.largeTitle)
                .padding()

            Spacer()

            Button("Search for nearby food") {
                // Action for searching nearby food
                print("Search for nearby food tapped")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)

            Button("Favorite Restaurants") {
                // Action for showing favorite restaurants
                print("Favorite Restaurants tapped")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(8)

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
