//
//  Game.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import Foundation

struct Games: Codable {
    
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case games = "results"
        
    }
}

struct Game: Codable, Identifiable {
    let id: Int
    let gamePath: String
    let name: String
    let released: String
    let image: String
    let rating: Double
//    let parent_platforms = [Platform]
//    let stores: [Store]
    let genres: [Genre]
//    let tags: [Tag]
//    let clip: Clip
    
    enum CodingKeys: String, CodingKey {
        case id
        case gamePath
        case name
        case released
        case image = "background_image"
        case rating
//        case parent_platforms
//        case stores
        case genres
//        case tags
//        case clip
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        
        let id = try container.decode(Int.self, forKey: .id)
        gamePath = "https://api.rawg.io/api/games/\(id)"
        
        name = try container.decode(String.self, forKey: .name)
        
        released = try container.decode(String.self, forKey: .released)
        
        image = try container.decode(String.self, forKey: .image)
        
        rating = try container.decode(Double.self, forKey: .rating)
        
//        parent_platforms = try container.decode([Platform].self, forKey: .parent_platforms)
//
//        stores = try container.decode([Store].self, forKey: .stores)
//
        genres = try container.decode([Genre].self, forKey: .genres)
//
//        tags = try container.decode([Tag].self, forKey: .tags)
//
//        clip = try container.decode(Clip.self, forKey: .clip)
        
    }
}

struct Clip: Codable {
    let clip: String
    let video: String
}

struct Tag: Codable {
    let id: Int
    let name: String
}

struct Genre: Codable {
    let id: Int
    let name: String
}

struct Store: Codable {
    let name: String
}

struct Platform: Codable {
    let name: String
}

struct GameDetail: Codable {
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
    
    enum CodingKeys: String, CodingKey {
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case gameId = "id"
        
    }
}






















