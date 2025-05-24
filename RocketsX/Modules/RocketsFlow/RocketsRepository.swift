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
        let cacheService: RocketStorageProtocol
        
        func getRockets() async throws -> [ResponseModels.RocketModel.Rocket] {
            let cachedEntities = try await cacheService.fetchRockets()
            if !cachedEntities.isEmpty {
                return cachedEntities.map { ResponseModels.RocketModel.Rocket(from: $0) }
            }
            
            let rockets = try await rocketsService.getRockets(RequestModels.Rockets())
            try await cacheService.saveRockets(rockets)
            
            return rockets
        }

    }
}
