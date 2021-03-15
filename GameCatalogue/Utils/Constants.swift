//
//  Constants.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 14/03/21.
//

import Foundation

struct Constants {
    
    static let baseUrl = "https://api.rawg.io/api/"
    static let placeHolder = "https://www.btklsby.go.id/images/placeholder/basic.png"
    
}

protocol Endpoint {
    
    var url: String { get }
    
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case game
        case search
        
        public var url: String {
            switch self {
            case .game: return "\(Constants.baseUrl)games?page="
            case .search: return "\(Constants.baseUrl)game?search="
            }
        }
    }
    
}

