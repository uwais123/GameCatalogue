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
    
//    func makeDetailView(for game: Game) -> some View {
//        let homeUseCase = Injection.init().provideHome()
//        let presenter =
//    }
}
