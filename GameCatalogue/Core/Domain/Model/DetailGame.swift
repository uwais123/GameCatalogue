//
//  Detail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

struct DetailGame: Decodable {
    
    var id: Int
    var name: String
    var description: String
    var released: String
    var image: String
    var rating: Double
    var playtime: Int
    
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
