//
//  Person.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

import SwiftUI

// Define a structure for the decoded JSON
struct Person: Identifiable, Codable {
    let id: Int
    let name: String
    let address: String
    let number: String
    let contactNumber: String
    let email: String
    let to: String
    let subject: String
}

typealias People = [Person]
