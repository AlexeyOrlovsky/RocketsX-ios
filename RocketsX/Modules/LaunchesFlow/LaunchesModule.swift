//
//  LaunchesModule.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import SwiftUI

// MARK: - LaunchesModule
struct LaunchesModule {
    typealias ViewModelProtocol = LaunchesViewModelProtocol
    
    @Inject(\.launchesService) private var launchesService
    @Inject(\.launchStorage) private var launchStorage
    
    func assemble(rocketId: String) -> some View {
        let repository = Repository(launchesService: launchesService, launchStorage: launchStorage)
        let useCase = UseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase, rocketId: rocketId)
        
        return MainView(viewModel: viewModel)
    }
}

// MARK: - LaunchesViewModelProtocol
protocol LaunchesViewModelProtocol: ObservableObject {
    var state: LaunchesModule.ViewState { get set }
    var launches: [ResponseModels.LaunchesModel.Launch] { get }
    var isLoading: Bool { get }
    var errorMessage: String? { get set }
    var hasLoadedOnce: Bool { get }
    
    func loadLaunches() async
    func onAppear()
}

