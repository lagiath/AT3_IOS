//
//  ReviewFormView.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 10/5/2024.
//
import SwiftUI
// Review form 
struct ReviewFormView: View {
    @Binding var place: Place
    var onDismiss: () -> Void
    
    @State private var rating: Int = 0
    @State private var reviewerName: String = ""
    @State private var comment: String = ""

    var body: some View {
        Form {
            Section(header: Text("Your Name")) {
                TextField("Name", text: $reviewerName)
            }
            Section(header: Text("Rating")) {
                Picker("Rating", selection: $rating) {
                    ForEach(1...5, id: \.self) { num in
                        Text("\(num) Stars").tag(num)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Comment")) {
                TextField("Write a comment...", text: $comment)
            }
            Section {
                Button("Submit Review") {
                    let newReview = Review(reviewerName: reviewerName, rating: rating, comment: comment)
                    place.addReview(newReview)
                    onDismiss()
                }
            }
        }
        .navigationTitle("Write a Review")
        .navigationBarItems(trailing: Button("Done") {
            onDismiss()
        })
    }
}
