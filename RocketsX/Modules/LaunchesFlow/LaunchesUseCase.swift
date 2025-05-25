//
//  LaunchesUseCase.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

private typealias Module = LaunchesModule

protocol LaunchesUseCaseProtocol {
}

// MARK: - UseCase
extension Module {
    struct UseCase: LaunchesUseCaseProtocol {
        private let repository: LaunchesRepositoryProtocol
        
        init(repository: LaunchesRepositoryProtocol) {
            self.repository = repository
        }
    }
}
