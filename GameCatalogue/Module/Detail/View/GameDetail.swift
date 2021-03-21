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
    let isFavorite: Bool
    @ObservedObject var presenter: DetailPresenter
    @State var favorite = false
    
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
                    .clipped()
                    .frame(height: 200, alignment: .center)
                    .cornerRadius(9)
                
                VStack(alignment: .leading) {
                    Text(self.presenter.detailGame.name)
                        .font(.title2)
                        .bold()
                    Text("Average Playtime: \(String(self.presenter.detailGame.playtime)) Hours")
                        .font(.subheadline)
                    
                    HStack {
                        Text(self.presenter.detailGame.released)
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
                        
                        // MARK: -- this is so unelegant way to this, but i've no idea :))
                        if !isFavorite {
                            HStack{}
                                .onAppear {
                                    favorite = false
                                }
                            
                        } else {
                            HStack{}
                                .onAppear {
                                    favorite = true
                                }
                        }
                        
                        if !favorite {
                            favoriteButton
                        } else {
                            unfavoriteButton
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
    
    var favoriteButton: some View {
        Button(action: {
            self.presenter.addFavoriteGames(from: presenter.detailGame)
            favorite = true
        }, label: {
            Image(systemName: "heart.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
                .padding(.trailing)
        })
    }
    
    var unfavoriteButton: some View {
        Button(action: {
            self.presenter.removeFavoriteGame(idGame: String(presenter.detailGame.id))
            favorite = false
        }, label: {
            Image(systemName: "heart.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
                .padding(.trailing)
        })
    }
}
