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
//            List {
//                ForEach() { item in
//                    NavigationLink(destination: GameFavoriteDetail(game: item)) {
//                        GameFavoritesRow()
//
//                    }.buttonStyle(PlainButtonStyle())
//                }.onDelete{ indexSet in
//                    let deleteItem = self.favGame[indexSet.first!]
//                    self.managedObjectContext.delete(deleteItem)
//
////                    do {
////                        try // get data from db
////                    } catch {
////                        // print(error)
////                    }
//                }
//                .onAppear {
//                    // TODO = get data from db
//                }
            }
            
            .navigationTitle("Favorites")
            .navigationBarItems(trailing: EditButton())
        }
//    .background(Color.white)
    }



struct GameFavorite_Previews: PreviewProvider {
    static var previews: some View {
        GameFavorite()
    }
}
