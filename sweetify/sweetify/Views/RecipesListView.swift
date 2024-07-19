//
//  RecipesListView.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation
import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel: RecipesListViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(viewModel.recipes.indices, id: \.self) { index in
                    NavigationLink(destination: RecipeDetailView(id: viewModel.recipes[index].id)){
                        RecipeCell(recipe: viewModel.recipes[index])
                    }
                }
            }
        }                
        .onAppear{
        print("fetching recipes")
        viewModel.fetchRecipes()
        }

    }
}

struct RecipeCell: View {
    let recipe: RecipeSummary
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "\(recipe.thumbnail)")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 30, height: 30)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            Text("\(recipe.name)")
            
        }
    }
}

