//
//  DetailGameResponse.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

struct DetailGameResponse: Decodable {
    
    let id: Int?
    let name: String?
    let description: String?
    let released: String?
    let image: String?
    let rating: Double?
    let playtime: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description = "description_raw"
        case released
        case image = "background_image"
        case rating
        case playtime
    }
}
