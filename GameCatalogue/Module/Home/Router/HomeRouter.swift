//
//  HomeRouter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import SwiftUI

class HomeRouter {
    
    func makeSearchView() -> some View {
        let searchUseCase = Injection.init().provideSearch()
        let presenter = SearchPresenter(searchUseCase: searchUseCase)
        return GameSearch(presenter: presenter)
    }
    
    func makeDetailView(for idGame: Int) -> some View {
        let detailUseCase = Injection.init().provideDetail()
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return GameDetail(idGame: idGame,presenter: presenter)
    }
}
