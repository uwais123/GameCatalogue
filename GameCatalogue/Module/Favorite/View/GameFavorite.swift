//
//  GameFavorite.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct GameFavorite: View {
    
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(self.presenter.favorites) { item in
                    GameFavoritesRow(game: item)
                }
            }
            .onAppear {
                self.presenter.getFavorites()
            }
            
            .navigationTitle("Favorites")
        }
    }
}
