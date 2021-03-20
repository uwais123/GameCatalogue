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
    @State private var isLoadMore = false
    
    var body: some View {
        NavigationView {
            VStack {
                if presenter.loadingState {
                    ActivityIndicator()
                } else {
                    content
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

extension GameView {
    var content: some View {
        ScrollView {
            self.presenter.linkToSearch() {
                SearchButton()
                    .padding(.top)
                    .padding(.bottom)
            }
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 120), spacing: 20, alignment: .center)
            ], alignment: .leading, spacing: 16, content: {
                ForEach(self.presenter.games.indices, id: \.self) { item in
                    let game = presenter.games[item]
                    self.presenter.linkToDetail(for: game.id) {
                        GameRow(game: game) // MARK: -- Implement paging
                            .onAppear {
                                if item == presenter.games.count - 1{
                                    isLoadMore = true
                                }
                            }
                            .alert(isPresented: $isLoadMore) {
                                Alert(title: Text("Load more data?"), message: Text("click yes to load more data"), primaryButton: .destructive(Text("No")) {
                                    isLoadMore = false
                                }, secondaryButton: .default(Text("Yes")) {
                                    page += 1
                                    presenter.getGames(page: page)
                                    print("current page: \(page)")
                                })
                            }
                    }.buttonStyle(PlainButtonStyle())
                    
                }
            }).padding(.horizontal, 12)
            
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
