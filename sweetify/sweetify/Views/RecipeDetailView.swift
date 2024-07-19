//
//  RecipeDetailView.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation
import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var viewModel: RecipeDetailViewModel
    let id : String
    var body: some View {
        VStack {
            Text("Hello.")
        }.onAppear{
            viewModel.findRecipe(id: id)
            viewModel.fetchRecipeDetails()
        }
    }
}
