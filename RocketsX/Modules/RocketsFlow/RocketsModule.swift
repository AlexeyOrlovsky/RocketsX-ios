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
    
//    @Inject(\.appRoutes) private var appRoutes
    @Inject(\.rocketsService) private var rocketsService
    
    func assemble() -> some UIViewController {
        let repository = Repository(rocketsService: rocketsService)
        let useCase = UseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)

        return Controller(viewModel: viewModel)
    }
}

// MARK: - RocketsViewModelProtocol
protocol RocketsViewModelProtocol: ObservableObject {
    func onAppear()
}
