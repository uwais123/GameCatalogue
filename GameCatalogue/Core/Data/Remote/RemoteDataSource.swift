//
//  RemoteDataSource.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 14/03/21.
//

import Foundation
import Combine
import Alamofire

protocol RemoteDataSourceProtocol: class {
    
    func getGames(page: Int) -> AnyPublisher<[GameResponse], Error>
    
    func getSearch(query: String) -> AnyPublisher<[ResultResponse], Error>
}

final class RemoteDataSouce: NSObject {
    
    override init() {}
    
    static let sharedInstance: RemoteDataSouce = RemoteDataSouce()
}

extension RemoteDataSouce: RemoteDataSourceProtocol {
    
    func getSearch(query: String) -> AnyPublisher<[ResultResponse], Error> {
        return Future<[ResultResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.search.url + query) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: SearchResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.results))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getGames(page: Int) -> AnyPublisher<[GameResponse], Error> {
        return Future<[GameResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.game.url + String(page)) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: GamesResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.games))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}