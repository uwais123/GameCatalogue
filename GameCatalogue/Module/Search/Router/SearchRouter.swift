//
//  SearchRouter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import SwiftUI

class SearchRouter {
    
    func makeDetailView(for idGame: Int) -> some View {
        let detailUseCase = Injection.init().provideDetail()
        let favoriteUsecase = Injection.init().provideFavorite()
        let presenter = DetailPresenter(detailUseCase: detailUseCase, favoriteUseCase: favoriteUsecase)
        return GameDetail(idGame: idGame, presenter: presenter)
    }
}


