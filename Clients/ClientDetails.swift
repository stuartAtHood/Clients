//
//  ClientDetails.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

import Foundation

// Define a structure for the decoded JSON
struct ClientDetails: Identifiable, Codable {
    // TODO from Person
    let id: Int
    let name: String
    let address: String
    let number: String
    let contactNumber: String
    let email: String
    let to: String
    let subject: String
    // extra details for billing
    let currentBill: Double
}
