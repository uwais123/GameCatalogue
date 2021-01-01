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
    @State var showProgressBar = false
    
    var body: some View {
        
        ZStack {
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
                            withAnimation {showProgressBar.toggle()}
                            page -= 1
                            self.networking.getGameData(page: page)
                        }, label: {
                            if page == 1 {
                                Text("")
                            } else {
                                Text("⬅️ Previous \(page - 1)")
                                    .font(.footnote)
                                    .foregroundColor(.black)
                            }
                            
                        }).padding(.leading)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {showProgressBar.toggle()}
                            page += 1
                            self.networking.getGameData(page: page)
                        }, label: {
                            Text("\(page + 1) Next ➡️")
                                .font(.footnote)
                                .foregroundColor(.black)
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
                .navigationBarItems(
                    trailing: NavigationLink(
                        destination: Profile()) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                    }
                )
            }
            if showProgressBar {
                ProgressView(placeHolder: "Loading...", show: $showProgressBar)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
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
