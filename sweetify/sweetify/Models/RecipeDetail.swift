//
//  RecipeDetail.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

struct RecipeDetail: Codable {
    let id: String
    let ingredients: [Ingredient]
    let instructions: String
}
