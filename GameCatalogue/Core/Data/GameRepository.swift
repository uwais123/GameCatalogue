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
    
    func getGames(page: Int) -> AnyPublisher<[Game], Error> {
        return self.locale.getGames()
            .flatMap { result -> AnyPublisher<[Game], Error> in
                if result.isEmpty || result.count < 5 {
                    return self.remote.getGames(page: page)
                        .map { GameMapper.mapResponseToEntity(input: $0) }
                        .flatMap { self.locale.addGames(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getGames()
                            .map { GameMapper.mapGameEntityToDomain(input: $0) }
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getGames()
                        .map { GameMapper.mapGameEntityToDomain(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
}
