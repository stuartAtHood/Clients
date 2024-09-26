//
//  PeopleViewModel.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

import Foundation

class PeopleViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        loadPeople()
    }
    
    func loadPeople() {
        guard let url = URL(string: "http://127.0.0.1:8081/api/clients.php") else {
            print("Invalid URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to load data: \(error.localizedDescription)")
                return
            }
            
            // Check the response status code
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("HTTP error: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                print("No data received.")
                return
            }
            
            do {
                // Debug print statements
                
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Received data string: \(dataString)")
                } else {
                    print("Failed to convert data to string.")
                }
                                        
                // Attempt to decode the JSON data into the Version struct
                let decodedPeople = try JSONDecoder().decode(People.self, from: data)

                // Update the published version property on the main thread
                DispatchQueue.main.async {
                    self.people = decodedPeople
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume() // Don't forget to start the data task
    }
}
