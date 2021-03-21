//
//  FavoritePresenter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/03/21.
//

import SwiftUI
import Combine

class FavoritePresenter: ObservableObject {
    
    private let router = FavoriteRouter()
    private let favoriteUseCase: FavoriteUseCase
    private var cancellables: Set<AnyCancellable> = []

    @Published var favorites: [Game] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavorites() {
        loadingState = true
        favoriteUseCase.getFavoriteGames()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { favorites in
                print("all favorites: \(favorites)")
                self.favorites = favorites
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
