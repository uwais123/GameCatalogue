//
//  Injection.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 14/03/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideRepository() -> GameRepositoryProtocol {
        let realm = try? Realm()
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSouce = RemoteDataSouce.sharedInstance
        return GameRepository.sharedInstance(locale, remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideSearch() -> SearchUseCase {
        let repository = provideRepository()
        return SearchInteractor(repository: repository)
    }
    
//    func provideSearch() ->
}
