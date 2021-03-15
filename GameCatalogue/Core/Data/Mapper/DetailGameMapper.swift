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
            id: detailGameResponse.id,
            name: detailGameResponse.name,
            description: detailGameResponse.description,
            released: detailGameResponse.released,
            image: detailGameResponse.image,
            rating: detailGameResponse.rating,
            playtime: detailGameResponse.playtime)
    }
    
//    static func mapGameEntityToDomain(
//        input gameEntity: [GameEntity]
//    ) -> [Game] {
//
//        return gameEntity.map { result in
//            return Game(
//                id: result.id,
//                name: result.name,
//                released: result.released,
//                image: result.image,
//                rating: result.rating,
//                playtime: result.playtime
//            )
//        }
//    }
}
