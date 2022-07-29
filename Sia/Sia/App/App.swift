//
//  App.swift
//  Sia
//
//  Created by Joey BARBIER on 21/07/2022.
//

import SwiftUI

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Home()
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
