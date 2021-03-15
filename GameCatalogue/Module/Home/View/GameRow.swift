//
//  GameRow.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct GameRow: View {
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            
            ZStack(alignment: .bottomTrailing) {
                
                WebImage(url: URL(string: Constants.placeHolder), options: .highPriority, context: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(22)
                
                HStack(alignment: .center, spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                    Text(String(0.0))
                        .font(.footnote)
                    
                }
                .foregroundColor(.black)
                .padding(10)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding(10)
            }
            
            Text("okm")
                .lineLimit(2)
                .font(.system(size: 14, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top, 11)
            
            Text("ok")
                .lineLimit(1)
                .font(.system(size: 10, weight: .medium))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
    }
}
