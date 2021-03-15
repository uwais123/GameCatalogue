//
//  DetailInteractor.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Combine

protocol DetailUseCase {
    
    func getDetail(idGame: Int) -> AnyPublisher<DetailGame, Error>
}

class DetailInteractor: DetailUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getDetail(idGame: Int) -> AnyPublisher<DetailGame, Error> {
        return repository.getDetail(idGame: idGame)
    }
    
}
