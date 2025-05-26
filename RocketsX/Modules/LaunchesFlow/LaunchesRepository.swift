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
        let launchesService: LaunchesService
        let launchStorage: LaunchStorageProtocol

        func getLaunches(for rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch] {
            let isFirstPage = page == 1

            if isFirstPage {
                let cached = try await launchStorage.fetchLaunches(for: rocketId)
                if !cached.isEmpty {
                    print("✅ Show cache (page 1): \(cached.count)")
                    return cached.map { ResponseModels.LaunchesModel.Launch(from: $0) }
                }
            }

            do {
                let launches = try await launchesService.getLaunches(rocketId: rocketId, page: page, limit: limit)
                try await launchStorage.saveLaunches(launches, for: rocketId)
                return launches
            } catch {
                print("❌ Error loading from network: \(error.localizedDescription)")

                if isFirstPage {
                    let cached = try await launchStorage.fetchLaunches(for: rocketId)
                    if !cached.isEmpty {
                        print("📦 Using cache due to network error: \(cached.count)")
                        return cached.map { ResponseModels.LaunchesModel.Launch(from: $0) }
                    }
                }
                throw error
            }
        }
    }
}
