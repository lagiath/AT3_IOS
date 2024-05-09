//
//  SearchView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter a restaurant name or cuisine type", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding()

                NavigationLink(destination: PlacesListView(searchTerm: searchText)) {
                    Text("Search")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Find a Restaurant")
        }
    }
}

#Preview {
    SearchView()
}
