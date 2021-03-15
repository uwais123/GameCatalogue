//
//  GameRepository.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation
import Combine

protocol GameRepositoryProtocol {
    
    func getGames(page: Int) -> AnyPublisher<[Game], Error>
    
    func getSearch(query: String) -> AnyPublisher<[Result], Error>
}

final class GameRepository: NSObject {
    
    typealias GameInstance = (LocaleDataSource, RemoteDataSouce) -> GameRepository
    
    fileprivate let remote: RemoteDataSouce
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSouce) {
        self.remote = remote
        self.locale = locale
    }
    
    static let sharedInstance: GameInstance = { localeRepo, remoteRepo in
        return GameRepository(locale: localeRepo, remote: remoteRepo)
    }
}

extension GameRepository: GameRepositoryProtocol {
    
    func getSearch(query: String) -> AnyPublisher<[Result], Error> {
        return self.remote.getSearch(query: query)
            .map { SearchMapper.mapSearchResponseToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
    
    func getGames(page: Int) -> AnyPublisher<[Game], Error> {
        return self.remote.getGames(page: page)
            .map { GameMapper.mapGameResponseToDomain(input: $0) }
            .eraseToAnyPublisher()
    }
}
