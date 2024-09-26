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
        let jsonString = """
        [{"sam":{"dbh":{},"vsam":{}},"id":646,"name":"Maurice Bamberger","address":"52 Richmond Avenue Prestwich M25 0LW ","number":"CL0646","companyName":"","contactNumber":"7946467658","domainName":null,"email":"mauricebamberger27441@gmail.com","to":"stuart@hoodies.co.uk","subject":"Invoice","headers":"From: stuart@inteleweb.com\\r\\nReply-To: stuart@hoodies.co.uk\\r\\nMIME-Version: 1.0\\r\\nContent-Type: multipart\\/mixed; boundary=\\"boundary\\"\\r\\nX-Mailer: PHP\\/8.2.20"},{"sam":{"dbh":{},"vsam":{}},"id":647,"name":"Shlomo Zalman Rosenbuam","address":"12 Melton Road Manchester M8 4HG","number":"CY0647","companyName":"","contactNumber":"","domainName":null,"email":"025797622r@gmail.com","to":"stuart@hoodies.co.uk","subject":"Invoice","headers":"From: stuart@inteleweb.com\\r\\nReply-To: stuart@hoodies.co.uk\\r\\nMIME-Version: 1.0\\r\\nContent-Type: multipart\\/mixed; boundary=\\"boundary\\"\\r\\nX-Mailer: PHP\\/8.2.20"}]
        """
        
        // Decode the JSON string into the people array
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let decodedPeople = try JSONDecoder().decode(People.self, from: jsonData)
                DispatchQueue.main.async {
                    self.people = decodedPeople
                }
            } catch {
                print("Failed to decode JSON: \(error)")
            }
        }
    }
}
