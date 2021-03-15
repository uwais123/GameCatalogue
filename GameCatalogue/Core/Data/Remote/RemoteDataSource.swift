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
}

final class RemoteDataSouce: NSObject {
    
    override init() {}
    
    static let sharedInstance: RemoteDataSouce = RemoteDataSouce()
}

extension RemoteDataSouce: RemoteDataSourceProtocol {
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
