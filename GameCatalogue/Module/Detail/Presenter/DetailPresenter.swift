//
//  DetailPresenter.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
    
//    private let router =
    private let detailUseCase: DetailUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var detailGame: DetailGame =
        DetailGame(id: 0, name: "", description: "", released: "", image: "", rating: 0.0, playtime: 0)
    
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getDetail(idGame: Int) {
        loadingState = true
        detailUseCase.getDetail(idGame: idGame)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                case .finished:
                    self.loadingState = false
                }
            }, receiveValue: { detailGame in
                print(detailGame.id)
                self.detailGame = detailGame
            })
            .store(in: &cancellables)
    }
    
}
