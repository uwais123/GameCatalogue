//
//  Game.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 17/12/20.
//

import UIKit
import SwiftUI
import SwiftyJSON

struct Games: Codable {
    let count: Float
    let next: String
    let previous: String
    let results: [Game]
}

struct Game: Codable, Identifiable  {
    var id: Float
    let name: String
    let released: String
    let background_image: String
//    let rating: Double
//    let parent_platforms: [Platforms]
//    let genres: [Genres]
//    let stores: [Stores]
//    let clip: Clip
//    let tags: [Tags]
//    let short_screenshots: [ScreenShots]
}

struct Genres: Codable {
    let name: String
}

// MARK: ScreenShots
struct ScreenShots: Codable {
    let image: String
}

// MARK: Clip
struct Clip: Codable {
    let clip: String
    let video: String
}

// MARK: Tags
struct Tags: Codable {
    let name: String
    
}

// MARK: Platforms
struct Platforms: Codable {
    let platform: Platform
}

struct Platform: Codable {
    let name: String
}

// MARK: store
struct Stores: Codable {
    let id: Float
    let store: Store
}

struct Store: Codable {
    let domain: String
}





















