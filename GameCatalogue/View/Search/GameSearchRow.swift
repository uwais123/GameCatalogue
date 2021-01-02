//
//  GameSearchRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 20/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameSearchRow: View {
    var game: Result
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            ZStack(alignment: .bottomTrailing) {
                
                WebImage(url: URL(string: game.backgroundImage ?? Constants.PLACEHOLDER), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(22)
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(String(game.rating ?? 0.0))
                        .font(.footnote)
                        .foregroundColor(.black)
                }
                .foregroundColor(.black)
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding(10)
            }
            
            Text(game.name ?? "Unknown")
                .lineLimit(2)
                .font(.system(size: 14, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, 11)
            
            Text(game.released ?? "Unknown")
                .lineLimit(1)
                .font(.system(size: 10, weight: .medium))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}


