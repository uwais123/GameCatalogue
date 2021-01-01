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


struct Game: Hashable ,Codable, Identifiable {
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

struct GameGenres: Codable {

    let id: Int
    let name: String
    let slug: String
    let gamesCount: Int
    let imageBackground: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case slug = "slug"
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}

struct GameDetails: Codable {
    var description: String
    
}

// MARK: - Search Game
struct PurpleData: Codable {
    
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case results
        
    }
}

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























