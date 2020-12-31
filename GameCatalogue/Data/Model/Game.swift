//
//  Game.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import Foundation
import RealmSwift


struct Games: Codable {
    
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case games = "results"
        
    }
}

struct Game: Codable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let image: String
    let rating: Double
    let playtime: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case released
        case image = "background_image"
        case rating
        case playtime
    }
    
    
}

struct GameDetails: Codable {
    var description: String
    
}

// MARK: - PurpleData
struct PurpleData: Codable {
    
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case results
        
    }
}

// MARK: - Result
struct Result: Codable, Identifiable {
    var id = UUID()
    let name: String?
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    let gameId: Int?
    let playtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case gameId = "id"
        case playtime
        
    }
}























