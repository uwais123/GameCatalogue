//
//  GameFavorite.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct GameFavorite: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(1..<10) { item in
                    GameFavoritesRow()
                }
                .onAppear {
                    // TODO = get data from db
                }
            }
            
            .navigationTitle("Favorites")
        }
        .background(Color.white)
        
    }
    
    struct GameFavorite_Previews: PreviewProvider {
        static var previews: some View {
            GameFavorite()
        }
    }
}
