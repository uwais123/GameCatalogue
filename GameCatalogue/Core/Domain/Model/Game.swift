//
//  Game.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import Foundation


struct Game: Hashable ,Codable, Identifiable {
    let id: Int
    let name: String
    let released: String
    let image: String
    let rating: Double
    let playtime: Int
    let favorite: Bool
    
}

// MARK: -- Game Genres
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

// MARK: -- Game Detail
struct GameDetails: Codable {
    var description: String
    
}
