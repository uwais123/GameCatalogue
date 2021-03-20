//
//  SearchPresenter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation
import Combine
import SwiftUI

class SearchPresenter: ObservableObject {
    
    private let router = SearchRouter()
    private let searchUseCase: SearchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var searchResults: [Game] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var searchText: String = String()
    
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
        
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .map { string in
                if string.count < 1 {
                    self.searchResults = []
                    return nil
                }
                return string
            }
            .compactMap { $0 }
            .sink { (_) in
                
            } receiveValue: { searchField in
                self.getSearch(query: searchField)
                
            }.store(in: &cancellables)
    }
    
    
    func getSearch(query: String) {
        loadingState = true
        searchUseCase.getSearch(query: query)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { searchResults in
                if searchResults.isEmpty {
                    self.errorMessage = "No Results"
                    print(self.errorMessage)
                } else {
                    self.searchResults = searchResults
                    print(searchResults)
                }
            })
            .store(in: &cancellables)
    }
    
    func linkToDetail<Content: View>(
        for idGame: Int,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeDetailView(for: idGame)
        ) { content() }
    }
    
}
