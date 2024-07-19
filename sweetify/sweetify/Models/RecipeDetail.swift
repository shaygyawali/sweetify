//
//  RecipeDetail.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

struct RecipeDetail: Codable {
    let idMeal: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let thumbnail: String
    let tags: String?
    let youtubeURL: String?
    let ingredients: [String]
    let measures: [String]
}
