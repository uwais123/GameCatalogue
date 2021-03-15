//
//  TextExtension.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 14/03/21.
//

import SwiftUI
import RealmSwift

extension String {
    
    func formatText() -> String {
        let text = self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        let result = text.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
        return result
    }
}
