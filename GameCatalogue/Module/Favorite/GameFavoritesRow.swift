//
//  GameFavoritesRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 28/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameFavoritesRow: View {
        
    var body: some View {
        HStack {
            WebImage(url: URL(string: Constants.placeHolder), options: .highPriority, context: nil)
                .resizable()
                .frame(width: 103, height: 103, alignment: .center)
                .cornerRadius(14)
                .padding(12)
            VStack(alignment: .leading) {
                Text("Unknown")
                    .lineLimit(2)
                    .font(.system(size: 14, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .padding(.top, 11)
                
                Text("Unknown")
                    .lineLimit(1)
                    .font(.system(size: 10, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(String(0.0))
                        .font(.system(size: 10, weight: .medium))
                    
                }
                .foregroundColor(.black)
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        
    }
}
