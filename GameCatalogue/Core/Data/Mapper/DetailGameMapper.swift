//
//  DetailGameMapper.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

final class DetailGameMapper {
    
    static func mapDetailResponseToDomain(
        input detailGameResponse: DetailGameResponse
    ) -> DetailGame {
        
        return DetailGame(
            id: detailGameResponse.id ?? 0,
            name: detailGameResponse.name ?? "Unknown",
            description: detailGameResponse.description ?? "Unknown",
            released: detailGameResponse.released ?? "Unknown",
            image: detailGameResponse.image ?? Constants.placeHolder,
            rating: detailGameResponse.rating ?? 0.0,
            playtime: detailGameResponse.playtime ?? 0)
    }
    
    static func mapEntityToDetailGame(
        input gameEntity: GameEntity
    ) -> DetailGame {
        
        return DetailGame(
            id: gameEntity.id,
            name: gameEntity.name,
            description: gameEntity.description,
            released: gameEntity.released,
            image: gameEntity.image,
            rating: gameEntity.rating,
            playtime: gameEntity.playtime
        )
    }
    
    static func mapDetailGameToEntity(
        input detaiGame: DetailGame
    ) -> GameEntity {
        let entity = GameEntity()
        entity.id = detaiGame.id
        entity.name = detaiGame.name
        entity.released = detaiGame.released
        entity.image = detaiGame.image
        entity.rating = detaiGame.rating
        entity.playtime = detaiGame.playtime
        return entity
    }
    
    
}
