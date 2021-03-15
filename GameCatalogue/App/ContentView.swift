//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var homePresenter: HomePresenter
    @EnvironmentObject var searchPresenter: SearchPresenter
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            GameView(presenter: homePresenter, searchPresenter: searchPresenter)
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
