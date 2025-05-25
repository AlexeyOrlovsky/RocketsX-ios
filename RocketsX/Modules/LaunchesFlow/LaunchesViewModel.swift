//
//  LaunchesViewModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

private typealias Module = LaunchesModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published var state = ViewState()
        
        // MARK: - Private Properties
        private let useCase: LaunchesUseCaseProtocol
        
        // MARK: - Helpers
        private var cancellable: CancelBag = .init()
        
        // MARK: - Init
        init(
            useCase: LaunchesUseCaseProtocol
        ) {
            self.useCase = useCase
        }
        
        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
        }
        
        // MARK: - Public Methods
    }
}


