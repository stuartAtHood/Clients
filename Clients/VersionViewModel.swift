import Foundation

class VersionViewModel: ObservableObject {
    @Published var version: Version?

    init() {
        loadVersion()
    }

    func loadVersion() {
        guard let url = URL(string: "http://127.0.0.1:8081/api/version.php") else {
            print("Invalid URL.")
            return
        }
                
        // Perform the network request asynchronously using URLSession
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
                let decodedVersion = try JSONDecoder().decode(Version.self, from: data)
                
                // Update the published version property on the main thread
                DispatchQueue.main.async {
                    self.version = decodedVersion
                    
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume() // Don't forget to start the data task
    }
}

