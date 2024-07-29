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
        if #available(iOS 16.0, *) {
            List(ingredients.indices, id: \.self) { index in
                HStack {
                    Text(ingredients[index].capitalized)
                    Spacer()
                    Text(measures[index])
                }
            }
            .scrollContentBackground(.hidden)
        } else {
            List(ingredients.indices, id: \.self) { index in
                HStack {
                    Text(ingredients[index].capitalized)
                    Spacer()
                    Text(measures[index])
                }
            }
            .background(Color.white)
        }
    }
}
