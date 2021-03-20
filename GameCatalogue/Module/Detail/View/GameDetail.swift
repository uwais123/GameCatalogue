//
//  GameDetail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 21/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameDetail: View {
    
    let idGame: Int
    @ObservedObject var presenter: DetailPresenter
    
    var body: some View {
        VStack {
            if self.presenter.loadingState {
                ActivityIndicator()
            } else {
                content
            }
        }
        .onAppear {
            self.presenter.getDetail(idGame: idGame)
        }
        .navigationTitle("Detail")
    }
    
}

extension GameDetail {
    
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: self.presenter.detailGame.image), options: .highPriority, context: nil)
                    .resizable()
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(9)
                
                VStack(alignment: .leading) {
                    Text(self.presenter.detailGame.name )
                        .font(.title2)
                        .bold()
                    Text("Average Playtime: \(String(self.presenter.detailGame.playtime )) Hours")
                        .font(.subheadline)
                    
                    HStack {
                        Text(self.presenter.detailGame.released )
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
                            Text(String(presenter.detailGame.rating))
                                .font(.subheadline)
                                .bold()
                        }
                        .padding(10)
                        .cornerRadius(10)
                        .padding(.bottom)
                        
                        Spacer()
                        
                        if presenter.isFavorite == false {
                            Button(action: {
                                self.presenter.addFavoriteGames(from: presenter.detailGame)
                            }, label: {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            })
                            
                            let _ = print(presenter.isFavorite)
                        } else {
                            Button(action: {
                                self.presenter.removeFavoriteGame(idGame: String(presenter.detailGame.id))
                            }, label: {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                    .padding(.trailing)
                            })
                        }
                        
                    }.padding(.top)
                    
                    Text("Description")
                        .font(.headline)
                        .bold()
                        .padding(3)
                    
                    Text(self.presenter.detailGame.description)
                        .font(.caption)
                        .padding(3)
                        .padding(.bottom)
                }
            }
            .padding(.horizontal)
        }
    }
}
