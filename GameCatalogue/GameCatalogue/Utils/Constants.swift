//
//  Constants.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import Foundation

struct Constants {

    // https://api.rawg.io/api/games?page=1
    static var BASE_URL = "https://api.rawg.io/api/\(ENDPOINT)?\(PARAM)"
    static var API_KEY = "cb66c401448544e0a135f1d5757f685a"
    static var ENDPOINT = "games"
    static var PARAM = "page=1"
}
