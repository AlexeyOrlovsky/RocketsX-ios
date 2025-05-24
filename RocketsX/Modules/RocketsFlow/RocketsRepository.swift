//
//  RocketsRepository.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import Foundation

private typealias Module = RocketsModule

protocol RocketsRepositoryProtocol {
    func getRockets() async throws -> [ResponseModels.RocketModel.Rocket]
}

// MARK: - Repository
extension Module {
    struct Repository: RocketsRepositoryProtocol {
        let rocketsService: RocketsService
        
        func getRockets() async throws -> [ResponseModels.RocketModel.Rocket] {
            try await rocketsService.getRockets(RequestModels.Rockets())
        }
    }
}
