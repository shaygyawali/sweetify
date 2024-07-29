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
    
    func getRecipes() async throws {
        isLoading = true
        errorMessage = nil
        
        //UI updates made in main thread
        Task {
            do {
                print("Fetching recipes FROM VM")
                let fetchedRecipes = try await recipeFetcher.fetchRecipes()
                await MainActor.run {
                    self.recipes = fetchedRecipes
                    self.isLoading = false
                }
                self.recipes = fetchedRecipes
            } catch {
                await MainActor.run {
                    print("found FROM VM")
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
            isLoading = false
        }
    }
}
