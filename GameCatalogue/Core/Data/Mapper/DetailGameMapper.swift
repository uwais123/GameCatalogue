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
}
