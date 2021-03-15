//
//  ContentView.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var homePresenter: HomePresenter
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            GameView(presenter: homePresenter)
                .tabItem {
                    TabItem(imageName: "tray.fill", title: "Home")
                }
            
            GameFavorite()
                .tabItem {
                    TabItem(imageName: "heart.fill", title: "Favorite")
                }
        }.accentColor(.blue)
    }
}

struct TabItem: View {
    var imageName: String
    var title: String
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
