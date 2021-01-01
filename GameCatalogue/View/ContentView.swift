//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            GameMenu()
                .tabItem {
                    Image(systemName: "tray.fill")
                    Text("Home")
                }
            
            GameFavorite()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .padding()
                    Text("Favorite")
                }
        }.accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
