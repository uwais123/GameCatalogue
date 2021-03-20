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
    
//    func formatDate() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM d, yyyy"
//        return dateFormatter.string(from: self)
//    }
    
    func formatDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM d, yyyy"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        guard let dateObj = dateFormatterGet.date(from: self) else { return "Unknown" }
        let formattedDate = dateFormatter.string(from: dateObj)
        
        return formattedDate
    }
    
    
}
