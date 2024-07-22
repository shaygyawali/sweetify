//
//  BackButton.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/21/24.
//

import Foundation
import SwiftUI

struct BackButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "chevron.backward")
            }
            .frame(width: 40, height: 40)
            .background(Color(.white))
            .foregroundColor(.black)
            .clipShape(Circle())
        }
    }
}
