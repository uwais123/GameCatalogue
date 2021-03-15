//
//  HomePresenter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation
import Combine
import SwiftUI

class HomePresenter: ObservableObject {
    
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var games: [Game] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getGames(page: Int) {
        loadingState = true
        homeUseCase.getGames(page: page)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { games in
                self.games = games
                print(games)
            })
            .store(in: &cancellables)
    }
    
    func linkToSearch<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(
            destination: router.makeSearchView()
        ) { content() }
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
