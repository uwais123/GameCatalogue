//
//  ProfileViewModel.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 03/01/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var name = "Uwais Alqadri"
    @Published var email = "uwaisalqadri654321@gmail.com"
    
    @Published var isEdit = false
}
