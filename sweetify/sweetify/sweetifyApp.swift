//
//  sweetifyApp.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import SwiftUI
import Combine

@main
struct sweetifyApp: App {
    @StateObject var viewModel = RecipesListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
