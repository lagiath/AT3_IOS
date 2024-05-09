//
//  ContentView.swift
//  AT3_IOS
//
//  Created by Daniel Gabb on 6/5/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("App Name Goes Here")
                    .font(.largeTitle)
                    .padding()

                Spacer()

                NavigationLink(destination: SearchView()) {
                    Text("Search for nearby food")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()

//                NavigationLink(destination: FavouritesView()) {
//                    Text("Favorite Restaurants")
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(8)
//                }
                .padding()

                Spacer()
            }
            .navigationTitle("Main Menu")
        }
    }
}


#Preview {
    ContentView()
}
