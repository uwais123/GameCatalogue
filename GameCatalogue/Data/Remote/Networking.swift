//
//  Networking.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/12/20.
//

import Foundation
import Alamofire

class Networking: ObservableObject {
    @Published var games = [Game]()
    @Published var searchedGame = [Result]()
    @Published var detail = String()
//    @Published var genres = String()
    
    func getGameData(page: Int) {
        AF.request("\(Constants.BASE_URL)\(Constants.ENDPOINT)?page=\(page)")
            .validate()
            .responseDecodable(of: Games.self, queue: DispatchQueue(label: "getGameData", qos: .userInteractive, attributes: .concurrent)) { response in
                guard let gameData = response.value else { return }
                DispatchQueue.main.async {
                    self.games = gameData.games
                }
            }
    }
    
    func getGameDetail(idGame: Int) {
        AF.request("\(Constants.BASE_URL)\(Constants.ENDPOINT)/\(String(idGame))")
            .validate()
            .responseDecodable(of: GameDetails.self, queue: DispatchQueue(label: "getGameDetail", qos: .userInteractive, attributes: .concurrent)) { response in
                guard let gameDetail = response.value else { return }
                DispatchQueue.main.async {
                    self.detail = gameDetail.description
                }
            }
    }
    
//    func getGameGenres(idGame: Int) {
//        AF.request("\(Constants.BASE_URL)\(Constants.ENDPOINT)/\(String(idGame))")
//            .validate()
//            .responseDecodable(of: GameGenres.self, queue: DispatchQueue(label: "getGenres", qos: .userInteractive, attributes: .concurrent)) { response in
//                guard let gameGenres = response.value else { return }
//                DispatchQueue.main.async {
//                    self.genres = gameGenres.name
//                }
//            }
//
//    }
    
    func getSearchData(query: String) {
        AF.request("\(Constants.BASE_URL)\(Constants.ENDPOINT)?search=\(query)")
            .validate()
            .responseDecodable(of: PurpleData.self, queue: DispatchQueue(label: "getSearchData", qos: .userInteractive, attributes: .concurrent)) { response in
                guard let gameData = response.value else { return }
                DispatchQueue.main.async {
                    self.searchedGame = gameData.results!
                }
            }
    }
    
}

struct Constants {
    
    // https://api.rawg.io/api/games?page=1
    static var BASE_URL = "https://api.rawg.io/api/"
    static var API_KEY = "cb66c401448544e0a135f1d5757f685a"
    static var ENDPOINT = "games"
}

func formatText(word: String) -> String {
    let a = word.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    let result = a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
    return result
}

