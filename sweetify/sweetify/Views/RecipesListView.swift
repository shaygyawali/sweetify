//
//  RecipesListView.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation
import SwiftUI

struct RecipesListView: View {
    @EnvironmentObject var viewModel : RecipesListViewModel
    @EnvironmentObject var detailViewModel: RecipeDetailViewModel
    @State private var searchText = ""
    var recipes : [RecipeSummary] = []
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView{
                    ForEach(searchResults.indices, id: \.self) { index in
                        NavigationLink(destination: RecipeDetailView(id: searchResults[index].id)){
                            RecipeCell(recipe: searchResults[index])
                        }
                    }
                }.navigationTitle("Sweetify Desserts")
                .searchable(text: $searchText)
            }
        }
        .onAppear{
        print("View Appeared: Fetching recipes")
            Task {
                do {
                    try await viewModel.getRecipes()
                }
                catch {
                    print("Failed to get recipes: \(error.localizedDescription)")
                }
            }
        }
        .environmentObject(detailViewModel)

    }
    
    var searchResults: [RecipeSummary] {
        if searchText.isEmpty {
            print("SearchBar: Search text is empty, returning all recipes")
            return viewModel.recipes
        } else {
            let lowercasedSearchText = searchText.lowercased()
            let filteredResults = viewModel.recipes.filter { $0.name.lowercased().contains(lowercasedSearchText) }
            print("SearchBar: Filtering recipes with search text: \(searchText)")
            print("SearchBar: Filtered results: \(filteredResults.map { $0.name })")
            return filteredResults
        }
    }
}

struct RecipeCell: View {
    let recipe: RecipeSummary
    var body: some View {
        ZStack(){
            AsyncImage(url: URL(string: "\(recipe.thumbnail)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(Color.black.opacity(0.4))
            } placeholder: {
                Image("sweetifyLoading")
                    .overlay(Color.black.opacity(0.2))

            }
            VStack(alignment: .leading) {
                Text("\(recipe.name)")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)
                Text("Dessert")
                    .foregroundColor(Color.white)
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "arrowshape.forward.circle.fill")
                        .foregroundColor(Color.white)
                }
            }
            .frame(width: UIScreen.main.bounds.width*0.70, height: 150, alignment: .leading)
        }
        .frame(width: UIScreen.main.bounds.width*0.85, height: 200, alignment: .leading)
        .background(Color("SelectInactive"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

