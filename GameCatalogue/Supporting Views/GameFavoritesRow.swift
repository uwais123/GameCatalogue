//
//  GameFavoritesRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 28/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
//
//struct GameFavoritesRow: View {
//
//    @EnvironmentObject var gameFavorites = GameFavorites()
//
//    var body: some View {
//        VStack(alignment: .center, spacing: 4) {
//
//            ZStack(alignment: .bottomTrailing) {
//
//                WebImage(url: URL(string: gameFavorites.image), options: .highPriority, context: nil)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .clipped()
//                    .frame(width: 150, height: 150, alignment: .center)
//                    .cornerRadius(22)
//
//                HStack(alignment: .center, spacing: 4) {
//                    Image(systemName: "star.fill")
//                        .resizable()
//                        .frame(width: 12, height: 12)
//                    Text(String(gameFavorites.rating))
//                        .font(.footnote)
//
//                }
//                .foregroundColor(.black)
//                .padding(10)
//                .background(Color.yellow)
//                .cornerRadius(10)
//                .padding(10)
//            }
//
//            Text(gameFavorites.name)
//                .lineLimit(2)
//                .font(.system(size: 14, weight: .semibold))
//                .multilineTextAlignment(.center)
//                .padding(.top, 11)
//
//            Text("\(gameFavorites.released)")
//                .lineLimit(1)
//                .font(.system(size: 10, weight: .medium))
//                .multilineTextAlignment(.center)
//
//            Spacer()
//        }
//    }
//}
//
//struct GameFavoritesRow_Previews: PreviewProvider {
//    static var previews: some View {
//        GameFavoritesRow()
//    }
//}
