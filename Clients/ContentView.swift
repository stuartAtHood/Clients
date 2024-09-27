//
//  ContentView.swift
//  Clients
//
//  Created by Stuart Hood on 26/09/2024.
//

// ContentView.swift
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {  // Wrap HomeView in NavigationView
            VStack {
                Image("Inteleweb")
                    .resizable()
                    .frame(width: 300, height: 100)
                    .imageScale(.small)
                    .foregroundStyle(.tint)
                Text("SAMS - version 1.0")
                    .padding(20)
                
                NavigationLink(destination: ClientsView()) {  // The NavigationLink should now work
                    Text("Client List")
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
}

struct ContentView: View {
    var body: some View {
        HomeView()  // Show HomeView as the main view
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview {
    HomeView()
}
