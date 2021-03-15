//
//  SearchInteractor.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Combine


protocol SearchUseCase {
    func getSearch(query: String) -> AnyPublisher<[Game], Error>
}

class SearchInteractor: SearchUseCase {
    
    private let repository: GameRepositoryProtocol
    
    required init(repository: GameRepositoryProtocol) {
        self.repository = repository
    }
    
    func getSearch(query: String) -> AnyPublisher<[Game], Error> {
        return repository.getSearch(query: query)
    }
}
