//
//  GameMapper.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

final class GameMapper {
    
    static func mapGameResponseToDomain(
        input gameResponse: [GameResponse]
    ) -> [Game] {
        
        return gameResponse.map { result in
            return Game(
                id: result.id,
                name: result.name,
                released: result.released,
                image: result.image,
                rating: result.rating,
                playtime: result.playtime
            )
        }
    }
    
    static func mapGameEntityToDomain(
        input gameEntity: [GameEntity]
    ) -> [Game] {
        
        return gameEntity.map { result in
            return Game(
                id: result.id,
                name: result.name,
                released: result.released,
                image: result.image,
                rating: result.rating,
                playtime: result.playtime
            )
        }
    }
    
    static func mapResponseToEntity(
        input gameResponse: [GameResponse]
    ) -> [GameEntity] {
        
        return gameResponse.map { response in
            let entity = GameEntity()
            entity.id = response.id
            entity.name = response.name
            entity.released = response.released
            entity.image = response.image
            entity.rating = response.rating
            entity.playtime = response.playtime
            return entity
        }
    }
    
    
//    @objc dynamic var id: Int = 0
//    @objc dynamic var name: String = ""
//    @objc dynamic var released: String = ""
//    @objc dynamic var image: String = ""
//    @objc dynamic var rating: Double = 0.0
//    @objc dynamic var playtime: Int = 0
}
