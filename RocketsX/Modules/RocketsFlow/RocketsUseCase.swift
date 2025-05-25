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
    func signOut() async throws
}

// MARK: - UseCase
extension Module {
    struct UseCase: RocketsUseCaseProtocol {
        private let repository: RocketsRepositoryProtocol
        private let authService: AuthServiceProtocol
        
        init(
            repository: RocketsRepositoryProtocol,
            authService: AuthServiceProtocol
        ) {
            self.repository = repository
            self.authService = authService
        }
        
        func getRockets() async throws -> [ResponseModels.RocketModel.Rocket] {
            try await repository.getRockets()
        }
        
        func signOut() async throws {
            try authService.signOut()
        }
    }
}
