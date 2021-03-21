//
//  Detail.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

struct DetailGame: Decodable {
    
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var released: String = ""
    var image: String = ""
    var rating: Double = 0.0
    var playtime: Int = 0

//    id: 0, name: "", description: "", released: "", image: "", rating: 0.0, playtime: 0
 
}
