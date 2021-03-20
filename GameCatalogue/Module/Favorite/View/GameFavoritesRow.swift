//
//  GameFavoritesRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 28/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameFavoritesRow: View {
    
    var game: Game
    
    var body: some View {
        HStack {
            image
            VStack(alignment: .leading) {
                title
                released
                rating
            }
            Spacer()
        }
        .cornerRadius(20)
        .padding()
    }
}

extension GameFavoritesRow {
    
    var image: some View {
        WebImage(url: URL(string: game.image), options: .highPriority, context: nil)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .frame(width: 103, height: 103, alignment: .center)
            .cornerRadius(14)
            .padding(12)
            .shadow(radius: 5)
            
    }
    
    var title: some View {
        Text(game.name)
            .lineLimit(2)
            .font(.system(size: 14, weight: .semibold))
            .multilineTextAlignment(.leading)
            .padding(.top, 11)
    }
    
    var released: some View {
        Text(game.released)
            .lineLimit(1)
            .font(.system(size: 10, weight: .medium))
            .multilineTextAlignment(.leading)
    }
    
    var rating: some View {
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
        .shadow(radius: 5)
    }
}


//struct GameFavoriteRow_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        GameFavoritesRow(game: <#Game#>).previewLayout(.sizeThatFits)
//    }
//}

