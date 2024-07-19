//
//  RecipesListViewModel.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

class RecipesListViewModel: ObservableObject {
    @Published var recipes : [RecipeSummary] = []
    @Published var error: String?
    
    func fetchRecipes(){
        let recipe1 = RecipeSummary(id: "53049", name: "Apam balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
        let recipe2 = RecipeSummary(id: "52893", name: "Apple & Blackberry Crumble", thumbnail: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
        let recipe3 = RecipeSummary(id: "52768", name: "Apple Frangipan Tart", thumbnail: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")
        let recipe4 = RecipeSummary(id: "52767", name: "Bakewell tart", thumbnail: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg")
        let recipe5 = RecipeSummary(id: "52855", name: "Banana Pancakes", thumbnail: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg")
        
        recipes = [recipe1, recipe2, recipe3, recipe4, recipe5]
    }
}
