//
//  GameCatalogueApp.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/12/20.
//

import SwiftUI
import CoreData

@main
struct GameCatalogueApp: App {
        
    var body: some Scene {
        WindowGroup {
            let homeUseCase = Injection.init().provideHome()
            let homePresenter = HomePresenter(homeUseCase: homeUseCase)
            
            let searchUseCase = Injection.init().provideSearch()
            let searchPresenter = SearchPresenter(searchUseCase: searchUseCase)
            
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(searchPresenter)
        }
    }
}
