//
//  RocketService.swift
//  RocketsX
//
//  Created by Алексей Орловский on 24.05.2025.
//

import SwiftData

protocol RocketStorageProtocol {
    func saveRockets(_ rockets: [ResponseModels.RocketModel.Rocket]) async throws
    func fetchRockets() async throws -> [RocketEntity]
}

final class RocketStorage: RocketStorageProtocol {
    let context: ModelContext?

    init(container: ModelContainer) {
        self.context = ModelContext(container)
    }

    func saveRockets(_ rockets: [ResponseModels.RocketModel.Rocket]) async throws {
        for rocket in rockets {
            let entity = RocketEntity(
                id: rocket.id,
                name: rocket.name,
                firstFlight: rocket.firstFlight,
                successRate: rocket.successRatePct,
                height: rocket.height.meters ?? .init(),
                diameter: rocket.diameter.meters ?? .init(),
                mass: Double(rocket.mass.kg)
            )
            context?.insert(entity)
        }
        try context?.save()
    }
    
    func fetchRockets() async throws -> [RocketEntity] {
        let descriptor = FetchDescriptor<RocketEntity>()
        let results = try context!.fetch(descriptor) // force unwrap
        print("🧪 [Storage] Cached rockets count: \(results.count)")
        return results
    }
}
