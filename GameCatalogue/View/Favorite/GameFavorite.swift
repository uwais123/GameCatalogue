//
//  GameFavorite.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct GameFavorite: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: GameFavorites.entity(), sortDescriptors: []) var favGame: FetchedResults<GameFavorites>
    @State private var removeItem = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(favGame, id: \.id) { item in
                    NavigationLink(destination: GameFavoriteDetail(game: item)) {
                        GameFavoritesRow(game: item)
                        
                    }.buttonStyle(PlainButtonStyle())
                }.onDelete{ indexSet in
                    let deleteItem = self.favGame[indexSet.first!]
                    self.managedObjectContext.delete(deleteItem)
                    
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        print(error)
                    }
                }
                .onAppear {
                    try? managedObjectContext.save()
                }
            }
            
            .navigationTitle("Favorites")
            .navigationBarItems(trailing: EditButton())
        }.background(Color.white)
    }
}


struct GameFavorite_Previews: PreviewProvider {
    static var previews: some View {
        GameFavorite()
    }
}
