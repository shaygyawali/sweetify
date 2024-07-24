//
//  RecipesListViewModel.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

class RecipesListViewModel: ObservableObject {
    @Published var recipes : [RecipeSummary] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let recipeFetcher = RecipeFetcher()
    
    func getRecipes() {
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let fetchedRecipes = try await recipeFetcher.fetchRecipes()
                self.recipes = fetchedRecipes
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
            print("🌎 \(recipes)")
        }
    }
}
