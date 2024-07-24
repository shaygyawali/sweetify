//
//  RecipeDetailViewModel.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    @Published var detail : RecipeDetail?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let recipeFetcher = RecipeFetcher()
    
    func fetchRecipeDetails() {
        print("📍 \(detail?.name)")
        print("📍 \(detail?.ingredients)")
    }
    
    func listifyInstructions(instructions: String) -> [String] {
        let instructionsList = instructions.components(separatedBy: "\n")
        return instructionsList
    }
    
    func listifyTags(tags: String) -> [String] {
        let tagList = tags.components(separatedBy: ".")
        return tagList
    }
    
    func findRecipe(id: String){
        isLoading = true
        errorMessage = nil
        Task {
            do {
                let finalDetails = try await recipeFetcher.fetchRecipe(idMeal: id)
                self.detail = finalDetails
            } catch {
                self.errorMessage = error.localizedDescription
            }
            isLoading = false
            print("🏳️ \(detail)")
        }
        
    }
    
}
