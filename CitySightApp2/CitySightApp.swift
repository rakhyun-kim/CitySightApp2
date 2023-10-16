//
//  CitySightApp.swift
//  CitySightApp
//
//  Created by Rakhyun Kim on 10/16/23.
//

import SwiftUI

@main
struct CitySightApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
