//
//  RestaurantManager.swift
//  AT3_IOS
//
//  Created by Aiden Hemaridis-smith on 6/5/2024.
//
//No idea if this will work i just mostly copied from the weatherAPI app and dont have an API key atm
import Foundation

class RestaurantManager: ObservableObject {
    @Published var restaurantData: RestaurantData?

    let restaurantURL = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json"
    let APIKey = "Your_API_Key_Here"
    
    func fetchRestaurant(restaurantName: String) {
        if let query = restaurantName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            let urlString = "\(restaurantURL)?input=\(query)&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours&key=\(APIKey)"
            performRequest(restaurantURL: urlString)
        }
    }
    
    func performRequest(restaurantURL: String) {
        if let url = URL(string: restaurantURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error fetching restaurant data: \(error.localizedDescription)")
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(restaurantData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(restaurantData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(RestaurantData.self, from: restaurantData)
            DispatchQueue.main.async {
                self.restaurantData = decodedData
            }
        } catch {
            print("Error decoding data: \(error)")
        }
    }
}


