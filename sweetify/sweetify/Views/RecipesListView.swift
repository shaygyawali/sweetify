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
        VStack {
            ForEach(viewModel.recipes.indices, id: \.self) { index in
                Text("\(viewModel.recipes[index].name)")
            }
        }
        .onAppear{
            print("fetching recipes")
            viewModel.fetchRecipes()
        }
    }
}

