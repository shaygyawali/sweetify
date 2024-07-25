//
//  ContentView.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel : RecipesListViewModel
    var body: some View {
        RecipesListView()
    }
}

/*#Preview {
    ContentView()
        .environmentObject(RecipesListViewModel(recipeFetcher: RecipeFetcher()))
        .environmentObject(RecipeDetailViewModel(recipeFetcher: RecipeFetcher()))
}*/
