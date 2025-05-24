//
//  RocketsUseCase.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import Foundation

private typealias Module = RocketsModule

protocol RocketsUseCaseProtocol {
    func getRockets() async throws -> [ResponseModels.RocketModel.Rocket]
}

// MARK: - UseCase
extension Module {
    struct UseCase: RocketsUseCaseProtocol {
        private let repository: RocketsRepositoryProtocol
        
        init(repository: RocketsRepositoryProtocol) {
            self.repository = repository
        }
        
        func getRockets() async throws -> [ResponseModels.RocketModel.Rocket] {
            try await repository.getRockets()
        }
    }
}
