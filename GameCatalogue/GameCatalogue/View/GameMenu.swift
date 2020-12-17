//
//  GameMenu.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 16/12/20.
//

import SwiftUI

struct GameMenu: View {
    
    @ObservedObject var list = Networking()

    var body: some View {
        NavigationView {
            Text("ok")
            .navigationTitle("Game")
        }
    }
}

struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        GameMenu()
    }
}
