//
//  LaunchesRepository.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

private typealias Module = LaunchesModule

protocol LaunchesRepositoryProtocol {
    func getLaunches(for rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch]
}

// MARK: - Repository
extension Module {
    struct Repository: LaunchesRepositoryProtocol {
        private let launchesService: LaunchesService
        
        init(launchesService: LaunchesService) {
            self.launchesService = launchesService
        }
        
        func getLaunches(for rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch] {
            try await launchesService.getLaunches(rocketId: rocketId, page: page, limit: limit)
        }
    }
}
