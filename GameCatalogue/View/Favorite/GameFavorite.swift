//
//  GameFavorite.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 01/01/21.
//

import SwiftUI

struct GameFavorite: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: GameFavorites.entity(), sortDescriptors: []) var favGame: FetchedResults<GameFavorites>
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .center),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .center),
                ], alignment: .leading, spacing: 16, content: {
                    ForEach(favGame, id: \.id) { item in
                        NavigationLink(destination: Text("Ok")) {
                            GameFavoritesRow(game: item)
                                .onLongPressGesture {
                                    showAlert = true
                                }.alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("Delete Item"),
                                        message: Text("Are you sure to delete this item?"),
                                        primaryButton: .default(Text("No")),
                                        secondaryButton: .default(Text("Yes"), action: {
                                            let deleteItem = favGame.first!
                                            moc.delete(deleteItem)
                                            
                                            do {
                                                try moc.save()
                                            } catch {
                                                print(error)
                                            }
                                        })
                                    )
                                }
                            
                        }.buttonStyle(PlainButtonStyle())
                    }
                })
                .padding(.top)
                .padding(.horizontal, 12)
            }
            .onAppear {
                try? moc.save()
            }
            .navigationTitle("Favorites")
        }
    }
}

struct GameFavorite_Previews: PreviewProvider {
    static var previews: some View {
        GameFavorite()
    }
}
