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
    
    func assemble() -> some View {
        let repository = Repository()
        let useCase = UseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)
        
        return MainView(viewModel: viewModel)
    }
}

// MARK: - LaunchesViewModelProtocol
protocol LaunchesViewModelProtocol: ObservableObject {
    var state: LaunchesModule.ViewState { get set }
    
    func onAppear()
}

