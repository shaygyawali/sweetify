//
//  RecipeIngredients.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/21/24.
//

import Foundation
import SwiftUI

struct RecipeIngredientsView: View {
    let ingredients: [String]
    let measures: [String]
    var body: some View {
        List(ingredients.indices, id: \.self) { index in
            HStack {
                Text(ingredients[index].capitalized ?? "Ingredient Holder")
                Spacer()
                Text(measures[index] ?? "X")
            }
        }
        .scrollContentBackground(.hidden)
    }
}
