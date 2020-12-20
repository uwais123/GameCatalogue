//
//  Profile.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 19/12/20.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 184, height: 184, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack(alignment: .center) {
                Text("Uwais Alqadri")
                    .bold()
                    .font(.title)
                
                Text("Aslinya Android Developer")
                    .font(.footnote)
                
                Link("Visit Instagram", destination: URL(string: "https://www.instagram.com/uwais.__alqadri/")!)
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                    .padding(.vertical)
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
