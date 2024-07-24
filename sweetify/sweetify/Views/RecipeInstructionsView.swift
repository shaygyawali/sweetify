//
//  RecipeInstructionsView.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/21/24.
//

import Foundation
import SwiftUI

struct RecipeInstructionsView: View {
    let instructions: [String]
    var body: some View {
        List(instructions.indices, id: \.self) { index in
            let trimmed = instructions[index].trimmingCharacters(in: .whitespacesAndNewlines)
            if !trimmed.isEmpty {
                Text("\(String(index + 1)). \(trimmed)")
            }
        }
        .scrollContentBackground(.hidden)

    }
}
