//
//  HomeInteractor.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Combine

protocol HomeUseCase {
    
    func getGames(page: Int) -> AnyPublisher<[Game], Error>
}

class HomeInteractor: HomeUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getGames(page: Int) -> AnyPublisher<[Game], Error> {
        return repository.getGames(page: page)
    }
}
