//
//  LaunchStorage.swift
//  RocketsX
//
//  Created by Алексей Орловский on 26.05.2025.
//

import Foundation
import SwiftData

protocol LaunchStorageProtocol {
    func saveLaunches(_ launches: [ResponseModels.LaunchesModel.Launch], for rocketId: String) async throws
    func fetchLaunches(for rocketId: String) async throws -> [LaunchEntity]
}

final class LaunchStorage: LaunchStorageProtocol {
    let context: ModelContext?

    init(container: ModelContainer) {
        self.context = ModelContext(container)
    }

    func saveLaunches(_ launches: [ResponseModels.LaunchesModel.Launch], for rocketId: String) async throws {
        for launch in launches {
            let entity = LaunchEntity(
                id: UUID().uuidString,
                name: launch.name,
                details: launch.details,
                dateUtc: launch.dateUtc,
                success: launch.success,
                patchSmall: launch.links.patch?.small,
                article: launch.links.article,
                rocketId: rocketId
            )
            context?.insert(entity)
        }
        try context?.save()
    }

    func fetchLaunches(for rocketId: String) async throws -> [LaunchEntity] {
        var descriptor = FetchDescriptor<LaunchEntity>()
        descriptor.predicate = #Predicate {
            $0.rocketId == rocketId
        }
        descriptor.sortBy = [.init(\.dateUtc, order: .reverse)]
        
        return try context!.fetch(descriptor)
    }
}
