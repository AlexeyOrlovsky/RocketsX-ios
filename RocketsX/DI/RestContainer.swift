//
//  RestContainer.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation
import Factory

extension Container: @retroactive AutoRegistering {
    public func autoRegister() {
        manager.defaultScope = .singleton
    }

    // MARK: - Coordinator
    var appRoutes: Factory<AppRoutes> {
        self { .init() }
    }

    var appCoordinator: Factory<AppCoordinatorModule> {
        self { .init() }
    }
    
    // MARK: - Modules
    var authModule: Factory<AuthModule> {
        self { .init() }
    }
}

