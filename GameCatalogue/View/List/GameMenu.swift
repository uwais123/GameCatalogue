//
//  GameMenu.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/12/20.
//

import SwiftUI

struct GameMenu: View {
    
    @ObservedObject var networking = Networking()
    @State private var page = 1
    @State var query = ""
    @State var isSearching = false
    @State var getSearchData = false

    var body: some View {
        
        NavigationView {
            ScrollView {
                NavigationLink(
                    destination: GameSearch(networking: networking, query: $query, isSearching: $isSearching, getSearchData: $getSearchData)
                ) {
                    SearchButton()
                        .padding(.top)
                        .padding(.bottom)
                }
                // Move Page
                HStack {
                    Button(action: {
                        page -= 1
                        self.networking.getGameData(page: page)
                    }, label: {
                        if page == 1 {
                            Text("")
                        } else {
                            Text("⬅️ Previous").font(.footnote)
                        }
                        
                    }).padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        page += 1
                        self.networking.getGameData(page: page)
                    }, label: {
                        Text("Next ➡️").font(.footnote)
                    }).padding(.trailing)
                }
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .center),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .center),
                ], alignment: .leading, spacing: 16, content: {
                    ForEach(networking.games) { item in
                        NavigationLink(destination: GameDetail(game: item)) {
                            GameRow(game: item)
                                
                        }.buttonStyle(PlainButtonStyle())
                    }
                }).padding(.horizontal, 12)
                
            }
            .navigationTitle("Games").onAppear {
                self.networking.getGameData(page: page)
            }
//            .navigationBarItems(leading: , trailing: ))
        }
    }
}

struct SearchButton: View {
    var body: some View {
        HStack {
            Text("Search Games")
                .padding(.horizontal)
                .frame(maxHeight: 5)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .foregroundColor(Color(.systemGray))
                .cornerRadius(10)
                .padding(.horizontal)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                    }.padding(.horizontal, 32)
                    .foregroundColor(.gray)
                ).transition(.move(edge: .trailing))
                .animation(.spring())
        }
        
    }
}



struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameMenu()
    }
}
