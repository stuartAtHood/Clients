//
//  ContentView.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PeopleViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.people) { person in
                // HStack to place ID and Name side by side
                HStack {
                    Text("\(person.id)")  // Display the ID
                        .frame(width: 50, alignment: .leading)  // Width for consistent spacing
                        .font(.caption)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text(person.name)    // Display the Name
                        .font(.caption)
                }
                .padding(.vertical, 0)  // Add vertical padding for better spacing
            }
            .navigationTitle("Clients")
        }
    }
}

#Preview {
    ContentView()
}
