//
//  RecipeSummary.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

struct Wrapper: Codable {
    let items: [RecipeSummary]
    
    enum CodingKeys: String, CodingKey {
        case items = "meals"
    }
}

struct RecipeSummary: Codable {
    let name: String
    let thumbnail: String
    let id: String

    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnail = "strMealThumb"
        case id = "idMeal"
    }
}
