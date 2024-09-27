//
//  ClientsView.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

import SwiftUI

struct ClientsView: View {
    @StateObject private var viewModel = PeopleViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.people) { person in
                // HStack to place ID and Name side by side
                HStack {
                    NavigationLink(destination: ClientDetailsView()) {
                        Text("\(person.id)")
                            .multilineTextAlignment(.leading)
                            .padding(.top, 0.0)
                            .font(.caption)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 50.0)
                    }
                    Text(person.name)    // Display the Name
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                }
                .padding(.vertical, 0)  // Add vertical padding for better spacing
            }
            .navigationTitle("Clients")
        }
        .padding(.top)
    }
}

#Preview {
    ClientsView()
}
