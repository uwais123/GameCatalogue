//
//  DetailPresenter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation
import Combine
import SwiftUI

class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    private let favoriteUseCase: FavoriteUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var detailGame: DetailGame =
        DetailGame(id: 0, name: "", description: "", released: "", image: "", rating: 0.0, playtime: 0)
    
    @State var isFavorite: Bool = false // ini penyebabnya guys
    
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(detailUseCase: DetailUseCase, favoriteUseCase: FavoriteUseCase) {
        self.detailUseCase = detailUseCase
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getDetail(idGame: Int) {
        loadingState = true
        detailUseCase.getDetail(idGame: idGame)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { detailGame in
                print(detailGame)
                self.detailGame = detailGame
            })
            .store(in: &cancellables)
    }
    
    func addFavoriteGames(from game: DetailGame) {
        favoriteUseCase.addFavoriteGames(from: game)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    print(completion)
                }
            }, receiveValue: { isFavorite in
                self.isFavorite.toggle()
            })
            .store(in: &cancellables)
    }
    
    func removeFavoriteGame(idGame: String) {
        favoriteUseCase.removeFavoriteGame(idGame: idGame)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    print(completion)
                }
            }, receiveValue: { isFavorite in
                self.isFavorite.toggle()
            })
            .store(in: &cancellables)
    }
    
    
}
