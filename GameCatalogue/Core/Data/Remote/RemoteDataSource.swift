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
    
    func getSearch(query: String) -> AnyPublisher<[GameResponse], Error>
    
    func getDetail(idGame: Int) -> AnyPublisher<DetailGameResponse, Error>
}

final class RemoteDataSouce: NSObject {
    
    override init() {}
    
    static let sharedInstance: RemoteDataSouce = RemoteDataSouce()
}

extension RemoteDataSouce: RemoteDataSourceProtocol {
    
    func getDetail(idGame: Int) -> AnyPublisher<DetailGameResponse, Error> {
        return Future<DetailGameResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.detail.url + String(idGame)) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: DetailGameResponse.self) { response in
                        switch response.result {
                        case .success:
                            completion(.success(response.value ?? DetailGameResponse(id: 0, name: "Unknown", description: "Unknown", released: "Unknown", image: Constants.placeHolder, rating: 0.0, playtime: 0)))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
        
    func getSearch(query: String) -> AnyPublisher<[GameResponse], Error> {
        return Future<[GameResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.search.url + query) {
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
