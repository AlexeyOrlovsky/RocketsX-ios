//
//  RocketsModule.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import SwiftUI

// MARK: - RocketsModule
struct RocketsModule {
    typealias ViewModelProtocol = RocketsViewModelProtocol
    
    @Inject(\.appRoutes) private var appRoutes
    @Inject(\.rocketsService) private var rocketsService
    @Inject(\.authService) private var authService
    @Inject(\.rocketStorage) private var rocketStorage
    
    func assemble() -> some UIViewController {
        let repository = Repository(rocketsService: rocketsService, rocketStorage: rocketStorage)
        let useCase = UseCase(repository: repository, authService: authService)
        let viewModel = ViewModel(useCase: useCase)
        let controller = UINavigationController(rootViewController: Controller(viewModel: viewModel, appRoutes: appRoutes))

        return controller
    }
}

// MARK: - RocketsViewModelProtocol
protocol RocketsViewModelProtocol: ObservableObject {
    func onAppear()
}
