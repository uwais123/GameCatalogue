//
//  GameMenu.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/12/20.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var presenter: HomePresenter
    @State private var page = 1
    
    var body: some View {
        NavigationView {
            VStack {
                if presenter.loadingState {
                    ProgressView(placeHolder: "Load Data..", show: true, animate: true)
                } else {
                    ScrollView {
                        self.presenter.linkBuilder() {
                            SearchButton()
                                .padding(.top)
                                .padding(.bottom)
                        }
                        // Move Page
                        HStack {
                            Button(action: {
                                page -= 1
                                self.presenter.getGames(page: page)
                            }, label: {
                                if page == 1 {
                                    Text("")
                                } else {
                                    Text("⬅️ Previous \(page - 1)")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                
                            }).padding(.leading)
                            
                            Spacer()
                            
                            Button(action: {
                                page += 1
                                self.presenter.getGames(page: page)
                            }, label: {
                                Text("\(page + 1) Next ➡️")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }).padding(.trailing)
                        }
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum: 120), spacing: 20, alignment: .center)
                        ], alignment: .leading, spacing: 16, content: {
                            ForEach(self.presenter.games) { item in
                                NavigationLink(destination: GameDetail()) {
                                    GameRow(game: item)
                                    
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }).padding(.horizontal, 12)
                    }
                }
            }
            .navigationTitle("Games")
            .navigationBarItems(
                trailing: NavigationLink(
                    destination: Profile()) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                }
            )
        }
        .onAppear {
            self.presenter.getGames(page: page)
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


//
//struct GameMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        GameMenu()
//    }
//}
