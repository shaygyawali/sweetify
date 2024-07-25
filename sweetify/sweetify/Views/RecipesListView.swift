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
                        NavigationLink(destination: RecipeDetailView(id: viewModel.recipes[index].id)){
                            RecipeCell(recipe: viewModel.recipes[index])
                        }
                    }
                }.navigationTitle("Sweetify Desserts")
                .searchable(text: $searchText)
            }
        }
        .onAppear{
        print("fetching recipes")
        viewModel.getRecipes()
        }
        .environmentObject(detailViewModel)

    }
    
    var searchResults: [RecipeSummary] {
        if searchText.isEmpty {
            return viewModel.recipes
        } else {
            return viewModel.recipes.filter { $0.name.lowercased().contains(searchText.lowercased()) }
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
                ProgressView()
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

