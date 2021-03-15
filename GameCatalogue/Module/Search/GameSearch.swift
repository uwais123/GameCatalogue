//
//  GameSearch.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 19/12/20.
//

import SwiftUI


struct GameSearch: View {
    
    @Binding var query: String
    @Binding var isSearching: Bool
    @Binding var getSearchData: Bool
    
    var body: some View {
        ScrollView {
            // MARK: start textfield
            HStack {
                HStack {
                    TextField("Search Games..", text: $query)
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
                                query = ""
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
                        getSearchData = true
                        
//                        self.networking.getSearchData(query: query)
                        
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
            
            if getSearchData == true {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 50, maximum: 200), spacing: 16)
                ], alignment: .leading, spacing: 16, content: {
//                    ForEach() { item in
//                        NavigationLink(destination: GameSearchDetail() {
//                            GameSearchRow()
//                        }.buttonStyle(PlainButtonStyle())
//                    }
                }).padding(.horizontal, 12)
            } else if getSearchData == false {
                Spacer()
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
            } else {
                VStack {
                    Image(systemName: "magnifyingglass")
                    Text("No Results")
                }
            }
        }
    }
}
