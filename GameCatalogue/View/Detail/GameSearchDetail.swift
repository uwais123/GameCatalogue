//
//  GameSearchDetail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameSearchDetail: View {
    
    @ObservedObject var networking = Networking()
    var game: Result
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: game.backgroundImage ?? "https://nostrahomes.com.au/uploads/cms/unknown.jpg"), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(9)
                
                VStack(alignment: .leading) {
                    Text(game.name ?? "Unknown")
                        .font(.title2)
                        .bold()
                    Text("Average Playtime: \(String(game.playtime ?? 0)) Hours")
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
                            Text(String(game.rating ?? 0.0))
                                .font(.footnote)
                                .bold()
                        }
                        .padding(10)
                        .cornerRadius(10)
                        .padding(.bottom)
                    }.padding(.top)
                    
                    Text("Description")
                        .font(.headline)
                        .bold()
                        .padding(3)
                    Text(networking.self.formatText(word: self.networking.detail))
                        .font(.caption)
                        .padding(3)
                }
            }
            .padding(.horizontal)
        }.onAppear {
            networking.self.getGameDetail(idGame: game.gameId ?? 0)
        }
    }
    
}
