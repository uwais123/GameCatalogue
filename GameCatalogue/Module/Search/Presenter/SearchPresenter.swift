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
    
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
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
                self.searchResults = searchResults
                print(searchResults)
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
