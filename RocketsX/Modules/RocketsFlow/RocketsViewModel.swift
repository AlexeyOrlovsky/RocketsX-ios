//
//  RocketsViewModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import Foundation

private typealias Module = RocketsModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        
        // MARK: - Private Properties
        private let useCase: RocketsUseCaseProtocol
        
        // MARK: - Helpers
        private var cancellable: CancelBag = .init()
        
        // MARK: - Init
        init(
            useCase: RocketsUseCaseProtocol
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
