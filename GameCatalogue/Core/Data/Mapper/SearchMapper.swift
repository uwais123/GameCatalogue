//
//  SearchMapper.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation

final class SearchMapper {
    
    static func mapSearchResponseToDomain(
        input searchResponse: [ResultResponse]
    ) -> [Result] {
        
        return searchResponse.map { result in
            return Result(
                id: result.id,
                name: result.name ?? "Unknown",
                released: result.released ?? "Unknown",
                backgroundImage: result.backgroundImage ?? Constants.placeHolder,
                rating: result.rating ?? 0.0,
                gameId: result.gameId ?? 0,
                playtime: result.playtime ?? 0
            )
        }
    }
    
}
