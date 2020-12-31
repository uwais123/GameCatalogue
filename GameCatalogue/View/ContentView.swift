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
            
            Profile()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .padding()
                    Text("Favorite")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
