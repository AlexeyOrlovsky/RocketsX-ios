//
//  LaunchesUseCase.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

private typealias Module = LaunchesModule

protocol LaunchesUseCaseProtocol {
    func fetchLaunches(for rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch]
}

// MARK: - UseCase
extension Module {
    struct UseCase: LaunchesUseCaseProtocol {
        private let repository: LaunchesRepositoryProtocol
        
        init(repository: LaunchesRepositoryProtocol) {
            self.repository = repository
        }
        
        func fetchLaunches(for rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch] {
            try await repository.getLaunches(for: rocketId, page: page, limit: limit)
        }
    }
}
