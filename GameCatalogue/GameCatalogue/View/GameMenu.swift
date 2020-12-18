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
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .center),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .center),
                ], alignment: .leading, spacing: 16, content: {
                    ForEach(list.games) {item in
                        GameRow(game: item)
                    }
                }).padding(.horizontal, 12)
            }
            .navigationTitle("Game")
        }
    }
}

struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { device in
                
                GameMenu()
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewDisplayName(device)
            }
        }
    }
}
