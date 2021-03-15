//
//  SearchResponse.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

struct SearchResponse: Codable {
    
    let results: [ResultResponse]
    
    enum CodingKeys: String, CodingKey {
        case results
        
    }
}

struct ResultResponse: Codable, Identifiable {
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