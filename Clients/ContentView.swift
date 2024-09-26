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
                VStack(alignment: .leading) {
                    Text(person.name)
                        .font(.headline)
                    Text(person.address)
                        .font(.subheadline)
                    Text("Email: \(person.email)")
                        .font(.subheadline)
                    Text("Contact: \(person.contactNumber)")
                        .font(.subheadline)
                }
                .padding()
            }
            .navigationTitle("People List")
        }
    }
}

#Preview {
    ContentView()
}
