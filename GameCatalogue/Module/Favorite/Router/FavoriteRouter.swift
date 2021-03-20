//
//  FavoriteRouter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 20/03/21.
//

import SwiftUI

class FavoriteRouter {
    
    func makeDetailView(for idGame: Int) -> some View {
        let detailUseCase = Injection.init().provideDetail()
        let favoriteUseCase = Injection.init().provideFavorite()
        let presenter = DetailPresenter(detailUseCase: detailUseCase, favoriteUseCase: favoriteUseCase)
        return GameDetail(idGame: idGame, presenter: presenter)
    }
}
