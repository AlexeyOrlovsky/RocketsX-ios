//
//  RocketsXApp.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import SwiftUI

@main
struct RocketsXApp: App {
    // MARK: - App Session
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    // MARK: - Dependencies
    @Inject(\.appCoordinator) var appCoordinator

    var body: some Scene {
        WindowGroup {
            appCoordinator.assemble()
        }
    }
}
