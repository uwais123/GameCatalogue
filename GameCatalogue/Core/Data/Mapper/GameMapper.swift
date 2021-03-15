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
                id: result.id ?? 0,
                name: result.name ?? "Unknown",
                released: result.released ?? "Unknown",
                image: result.image ?? Constants.placeHolder,
                rating: result.rating ?? 0.0,
                playtime: result.playtime ?? 0
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
            entity.id = response.id ?? 0
            entity.name = response.name ?? "Unknown"
            entity.released = response.released ?? "Unknown"
            entity.image = response.image ?? Constants.placeHolder
            entity.rating = response.rating ?? 0.0
            entity.playtime = response.playtime ?? 0
            return entity
        }
    }
}
