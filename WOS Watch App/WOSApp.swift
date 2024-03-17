//
//  WOSApp.swift
//  WOS Watch App
//
//  Created by Issei Ueda on 2024/03/17.
//

import SwiftUI

@main
struct WOS_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: SessionViewModel())
        }
    }
}
