//
//  ContentView.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClientDetailsViewModel()

    var body: some View {
        VStack {
            Image("Inteleweb")
                .resizable()
                .frame(width: 300, height: 100)
                .imageScale(.small)
                .foregroundStyle(.tint)
            Text("SAMS - version 1.0")
                .padding(20)
            NavigationLink(destination: ClientsView()) {
                Text("client list")
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
