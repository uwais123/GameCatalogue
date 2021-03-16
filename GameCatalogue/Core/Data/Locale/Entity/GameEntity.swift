//
//  GameEntity.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 15/03/21.
//

import Foundation
import RealmSwift

public class GameEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var playtime: Int = 0
    @objc dynamic var favorite: Bool = false
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}

