//
//  ContentView.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: RecipesListViewModel
    var body: some View {
        RecipesListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesListViewModel())
        .environmentObject(RecipeDetailViewModel())
}
