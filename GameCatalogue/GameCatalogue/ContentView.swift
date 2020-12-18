//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 18/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            GameMenu()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Home")
                }
            
            Text("Card")
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                        .frame(width: 23, height: 20)
                        .padding()
                    Text("Card")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                        .padding()
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
