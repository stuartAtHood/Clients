//
//  ClientDetailsView.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

import SwiftUI

struct ClientDetailsView: View {
    @StateObject private var viewModel = ClientDetailsViewModel()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 4.0) {
                if let clientDetails = viewModel.clientDetails {
                    let bill = clientDetails.currentBill.formatted(.number.precision(.fractionLength(2)))
                    Text("\(clientDetails.name)")
                        .font(.headline)
                    Text("\(clientDetails.address)")
                        .font(.headline)
                    Text("Account: \(clientDetails.number)")
                        .font(.subheadline)
                        .padding(.top, 10.0)
                    Text("Phone: \(clientDetails.contactNumber)")
                        .font(.subheadline)
                        .padding(.top, 1.0)
                    Text("Email: \(clientDetails.email)")
                        .font(.subheadline)
                        .padding(.top, 1.0)
                    Text("Current bill: £\(bill)")
                        .font(.headline)
                        .padding(.top, 10.0)
                }
            }
            .padding(.top, -330.0)
//            .navigationTitle("Client Details")
        }
    }
}

#Preview {
    ClientDetailsView()
}
