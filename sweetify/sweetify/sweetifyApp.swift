//
//  sweetifyApp.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import SwiftUI
import Combine

@main
struct sweetifyApp: App {
    private var recipeFetcher = RecipeFetcher()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(RecipesListViewModel(recipeFetcher: recipeFetcher))
                .environmentObject(RecipeDetailViewModel(recipeFetcher: recipeFetcher))
        }
    }
}
