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
    
    func getGameData(page: Int) {
        AF.request("\(Constants.BASE_URL)\(Constants.ENDPOINT)?page=\(page)")
            .validate()
            .responseDecodable(of: Games.self) { response in
                guard let gameData = response.value else { return }
                self.games = gameData.games
            }
    }
    
    func getSearchData(query: String) {
        AF.request("\(Constants.BASE_URL)\(Constants.ENDPOINT)?search=\(query)")
            .validate()
            .responseDecodable(of: PurpleData.self) { response in
                guard let gameData = response.value else { return }
                self.searchedGame = gameData.results!
            }
    }
    
}

struct Constants {

    // https://api.rawg.io/api/games?page=1
    static var BASE_URL = "https://api.rawg.io/api/"
    static var API_KEY = "cb66c401448544e0a135f1d5757f685a"
    static var ENDPOINT = "games"
    static var YOUTUBE_EMBED = "https://www.youtube.com/embed/"
}

