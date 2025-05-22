//
//  AppCoordinator.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import FlowStacks
import SwiftUI

private typealias Module = AppCoordinatorModule

// MARK: - AppCoordinator
extension Module {
    struct AppCoordinator<ViewModel: ViewModelProtocol>: View {
        @StateObject var viewModel: ViewModel
        
        // MARK: - Private
        @Inject(\.authModule) private var authModule
        
        var body: some View {
            Router(viewModel.routes) { screen, _ in
                switch screen {
                case .splash:
                    authModule.assembleSplash()
                case .signIn:
                    authModule.assembleSignIn()
                }
            }
        }
    }
}
