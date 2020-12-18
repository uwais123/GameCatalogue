//
//  Networking.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/12/20.
//

import Foundation
import UIKit
import SwiftyJSON

class Networking: ObservableObject {
    @Published var games = [Game]()
    
    init() {
        let source = Constants.BASE_URL
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            } else {
                print(String(data: data!, encoding: .utf8)!)
            }
            
            let json = try! JSON(data: data!)
            
            for game in json["results"] {
                let id = game.1["id"].floatValue
                let name = game.1["name"].stringValue
                let released = game.1["released"].stringValue
                let backgroundImage = game.1["background_image"].stringValue
                
                DispatchQueue.main.async {
                    self.games.append(Game(id: id, name: name, released: released, background_image: backgroundImage))
                }
            }
        }
        
        task.resume()
    }
}
