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
            Text("\(String(index + 1)). \(instructions[index])")
        }
        .scrollContentBackground(.hidden)

    }
}
