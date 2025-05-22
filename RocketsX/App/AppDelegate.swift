//
//  AppDelegate.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    
    // MARK: - UIApplicationDelegate
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // #if RELEASE
        FirebaseApp.configure()
        // #endif
        
        return true
    }
}
