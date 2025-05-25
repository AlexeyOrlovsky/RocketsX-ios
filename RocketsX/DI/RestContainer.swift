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
    
    var rocketsModule: Factory<RocketsModule> {
        self { .init() }
    }
    
    // MARK: - Networking
    var restClient: Factory<RestClient> {
        self { RestClient(baseURL: ApiURLsPath.baseApiUrl) }
    }

    var rocketsService: Factory<RocketsService> {
        self { RestRocketsService(restClient: self.restClient.resolve()) }
    }
    
    var authService: Factory<AuthService> {
        self { .init() }
    }
    
    // MARK: - Managers
    var rocketStorage: Factory<RocketStorage> {
        self { .init(container: AppDelegate.sharedContainer) }
    }
}

