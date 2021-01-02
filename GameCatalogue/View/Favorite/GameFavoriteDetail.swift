//
//  GameFavoriteDetail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 02/01/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameFavoriteDetail: View {
    
    @ObservedObject var networking = Networking()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: GameFavorites.entity(), sortDescriptors: []) var favorites: FetchedResults<GameFavorites>
    var game: GameFavorites
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: game.image ?? Constants.PLACEHOLDER), options: .highPriority, context: nil)
                    .resizable()
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(9)
                
                VStack(alignment: .leading) {
                    Text(game.name ?? "Unknown")
                        .font(.title2)
                        .bold()
                    Text("Average Playtime: \(String(game.playtime)) Hours")
                        .font(.subheadline)
                    
                    HStack {
                        Text(game.released ?? "Unknown")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.yellow)
                            .cornerRadius(10)
                            .padding(.bottom)
                        
                        HStack(alignment: .center) {
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.yellow)
                            Text(String(game.rating))
                                .font(.footnote)
                                .bold()
                        }
                        .padding(10)
                        .cornerRadius(10)
                        .padding(.bottom)
                        
                        Spacer()
                        
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                            .padding(.trailing)
                        
                    }.padding(.top)
                    
                    Text("Description")
                        .font(.headline)
                        .bold()
                        .padding(3)
                    Text(formatText(word: self.networking.detail))
                        .font(.caption)
                        .padding(3)
                }
            }
            .padding(.horizontal)
        }.onAppear {
            networking.self.getGameDetail(idGame: Int(game.idGame))
        }
    }
}
