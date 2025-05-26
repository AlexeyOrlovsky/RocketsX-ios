//
//  AppDelegate.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import UIKit
import Firebase
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - SwiftData
    static var sharedContainer: ModelContainer! // force unwrap!!!
    
    // MARK: - UIApplicationDelegate
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // #if RELEASE
        FirebaseApp.configure()
        // #endif
        configureSwiftData()
        
        return true
    }
}

// MARK: - Private Methods
private extension AppDelegate {
    private func configureSwiftData() {
        do {
            let schema = Schema([RocketEntity.self, LaunchEntity.self])
            let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            Self.sharedContainer = try ModelContainer(for: schema, configurations: [config])
        } catch {
            print("⚠️ Failed to configure SwiftData: \(error)")
        }
    }
}
