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
    
}
