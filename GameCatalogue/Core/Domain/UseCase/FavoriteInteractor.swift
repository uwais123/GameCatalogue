//
//  Favorite.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/03/21.
//

import Combine


protocol FavoriteUseCase {
    
    func getFavoriteGames() -> AnyPublisher<[Game], Error>

    func addFavoriteGames(from game: DetailGame) -> AnyPublisher<Bool, Error>
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFavoriteGames() -> AnyPublisher<[Game], Error> {
        return repository.getFavoriteGames()
    }
    
    func addFavoriteGames(from game: DetailGame) -> AnyPublisher<Bool, Error> {
        return repository.addFavoriteGames(from: game)
    }
    
}

