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
    
    private let recipeFetcher : RecipeFetching
    
    init(recipeFetcher: RecipeFetching){
        self.recipeFetcher = recipeFetcher
    }
    
    func getRecipes() {
        isLoading = true
        errorMessage = nil
        
        // Making sure UI updates are made on the main thread
        Task {
            do {
                let fetchedRecipes = try await recipeFetcher.fetchRecipes()
                await MainActor.run {
                    self.recipes = fetchedRecipes
                    self.isLoading = false
                }
                self.recipes = fetchedRecipes
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
            isLoading = false
        }
    }
}
