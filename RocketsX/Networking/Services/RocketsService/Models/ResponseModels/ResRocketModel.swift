//
//  ResRocketModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 24.05.2025.
//

import Foundation

extension ResponseModels {
    struct RocketModel {
        struct Rocket: Codable {
            let id: String
            let name: String
            let firstFlight: String
            let successRatePct: Int
            let height: Dimension
            let diameter: Dimension
            let mass: Mass
        }

        struct Dimension: Codable {
            let meters: Double?
        }

        struct Mass: Codable {
            let kg: Int
        }
    }
}

extension ResponseModels.RocketModel.Rocket {
    init(from entity: RocketEntity) {
        self.init(
            id: entity.id,
            name: entity.name,
            firstFlight: entity.firstFlight,
            successRatePct: entity.successRate,
            height: .init(meters: entity.height),
            diameter: .init(meters: entity.diameter),
            mass: .init(kg: Int(entity.mass))
        )
    }
}
