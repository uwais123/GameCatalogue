//
//  GameDetail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameDetail: View {
    
    @ObservedObject var networking = Networking()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: GameFavorites.entity(), sortDescriptors: []) var favorites: FetchedResults<GameFavorites>
    @State var isFavorite = false
    var game: Game
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: game.image), options: .highPriority, context: nil)
                    .resizable()
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(9)
                
                VStack(alignment: .leading) {
                    Text(game.name)
                        .font(.title2)
                        .bold()
                    Text("Average Playtime: \(String(game.playtime)) Hours")
                        .font(.subheadline)
                    
                    HStack {
                        Text("\(game.released)")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .padding(.bottom)
                        
                        HStack(alignment: .center, spacing: 3) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.yellow)
                            Text(String(game.rating))
                                .font(.subheadline)
                                .bold()
                        }
                        .padding(10)
                        .cornerRadius(10)
                        .padding(.bottom)
                        
                        Spacer()
                        
                        if isFavorite == false {
                            Button(action: {
                                isFavorite = true
                                let gameFav = GameFavorites(context: self.managedObjectContext)
                                gameFav.id = UUID()
                                gameFav.idGame = Int32(game.id)
                                gameFav.name = String(game.name)
                                gameFav.image = String(game.image)
                                gameFav.released = String(game.released)
                                gameFav.rating = Double(game.rating)
                                gameFav.playtime = Int32(game.playtime)
                                
                                do {
                                    try self.managedObjectContext.save()
                                } catch {
                                    print(error)
                                }
                            }, label: {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            })
                        } else if isFavorite == true {
                            Button(action: {}, label: {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                    .padding(.trailing)
                            }).alert(isPresented: $isFavorite) {
                                Alert(title: Text("Game Added!"), message: Text("Your game has been added to your favorites list"), dismissButton: .default(Text("Got it!")))
                            }
                        }
                        
                    }.padding(.top)
                    
                    Text("Description")
                        .font(.headline)
                        .bold()
                        .padding(3)
                    
                    Text(formatText(word: self.networking.detail))
                        .font(.caption)
                        .padding(3)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            networking.self.getGameDetail(idGame: game.id)
        }
    }
}
