//
//  RecipeFetcher.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/22/24.
//

import Foundation

protocol RecipeFetching {
    func fetchRecipes() async throws -> [RecipeSummary]
    func fetchRecipe(idMeal: String) async throws -> RecipeDetail
}

actor RecipeFetcher: RecipeFetching {
    private let apiURL = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    
    func fetchRecipes() async throws -> [RecipeSummary] {
        guard let url = URL(string: apiURL) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Wrapper.self, from: data)
        print("All recipes: \(response.items)")
        return response.items
    }
    
    func fetchRecipe(idMeal: String) async throws -> RecipeDetail {
        let recipeURL = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)"
        
        guard let url = URL(string: recipeURL) else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(DetailWrapper.self, from: data)

        guard let detail = response.items.first else {
            throw URLError(.badServerResponse)
        }
        print("Details: \(detail)")
        return detail
    }
}
