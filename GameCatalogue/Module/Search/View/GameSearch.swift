//
//  GameSearch.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 19/12/20.
//

import SwiftUI


struct GameSearch: View {
    
    @ObservedObject var presenter: SearchPresenter
    @State var isSearching = false
    
    var body: some View {
        ScrollView {
            // MARK: start textfield
            HStack {
                HStack {
                    TextField("Search Games..", text: $presenter.searchText) // MARK: -- Reactive Search
                        .frame(height: 5)
                        .padding(.leading, 24)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .onTapGesture(perform: {
                    isSearching = true
                })
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        
                        if isSearching {
                            Button(action: {
                                presenter.searchText = ""
                                isSearching = false
                                
                            }, label: {
                                Image(systemName: "xmark.circle.fill")
                                    .padding(.vertical)
                            })
                            
                        }
                        
                    }.padding(.horizontal, 32)
                    .foregroundColor(.gray)
                ).transition(.move(edge: .trailing))
                .animation(.spring())
                
                if isSearching {
                    Button(action: {
                        isSearching = true
                        
                        self.presenter.getSearch(query: self.presenter.searchText)
                        
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        
                    }, label: {
                        Text("Search")
                            .padding(.trailing)
                            .padding(.leading, 0)
                    })
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                }
                
            }
            // MARK: end textfield
            
            Spacer(minLength: 60)
            
            if !self.presenter.searchText.isEmpty {
                if self.presenter.loadingState {
                    ActivityIndicator()
                } else {
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 120), spacing: 20, alignment: .center)
                    ], alignment: .leading, spacing: 16, content: {
                        ForEach(self.presenter.searchResults) { item in
                            self.presenter.linkToDetail(for: item.id) {
                                GameSearchRow(game: item)
                            }.buttonStyle(PlainButtonStyle())
                        }
                        
                    }).padding(.horizontal, 12)
                    
                    if presenter.searchResults.isEmpty {
                        VStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(.secondary)
                            
                            Text(presenter.errorMessage)
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                                .bold()
                        }
                        .padding(.top)
                        .padding(.top)
                    }
                }
                
            } else { // MARK: -- need to replace with lottie
                VStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.secondary)
                    
                    Text("Search Games")
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        .bold()
                }
                .padding(.top)
                .padding(.top)
            }
        }
        .navigationTitle("Search")
    }
}
