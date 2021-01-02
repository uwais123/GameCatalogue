//
//  GameFavoritesRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 28/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameFavoritesRow: View {
    
    var game: GameFavorites
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: game.image ?? "https://nostrahomes.com.au/uploads/cms/unknown.jpg"), options: .highPriority, context: nil)
                .resizable()
                .frame(width: 103, height: 103, alignment: .center)
                .cornerRadius(14)
                .padding(12)
            VStack(alignment: .leading) {
                Text(game.name ?? "Unknown")
                    .lineLimit(2)
                    .font(.system(size: 14, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 11)
                
                Text(game.released ?? "Unknown")
                    .lineLimit(1)
                    .font(.system(size: 10, weight: .medium))
                    .multilineTextAlignment(.center)
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(String(game.rating))
                        .font(.system(size: 10, weight: .medium))
                    
                }
                .foregroundColor(.black)
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
            }
            
            Spacer()
        }
//        .frame(width: 331, height: 127)
        
    }
}

//struct GameFavoritesRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GameFavoritesRow()
//            .previewLayout(.sizeThatFits)
//    }
//}
