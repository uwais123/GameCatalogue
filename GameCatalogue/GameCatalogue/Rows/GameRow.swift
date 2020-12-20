//
//  GameRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameRow: View {
    var game: Game
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            ZStack(alignment: .bottomTrailing) {
                
                WebImage(url: URL(string: game.image), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: 180,height: 180)
                    .cornerRadius(22)
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(String(game.rating))
                        .font(.footnote)
                        
                }
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding(10)
            }
            
            Text(game.name)
                .lineLimit(2)
                .font(.system(size: 14, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, 11)
            
            Text(game.released)
                .lineLimit(1)
                .font(.system(size: 10, weight: .medium))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}

//struct GameRow_Previews: PreviewProvider {
//    static var previews: some View {
//        let list = Networking()
//        ForEach(list.games) { item in
//            GameRow(game: item)
//        }
//    }
//}
