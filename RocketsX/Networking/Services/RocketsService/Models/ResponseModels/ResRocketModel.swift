//
//  ResRocketModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 24.05.2025.
//

import Foundation

extension ResponseModels {
    struct RocketModel {
        struct Rocket: Decodable {
            let id: String
            let name: String
            let firstFlight: String
            let successRatePct: Int
            let height: Dimension
            let diameter: Dimension
            let mass: Mass

//            enum CodingKeys: String, CodingKey {
//                case id, name
//                case successRatePct = "success_rate_pct"
//                case height, diameter, mass
//            }
        }

        struct Dimension: Decodable {
            let meters: Double?
        }

        struct Mass: Decodable {
            let kg: Int
        }
    }
}

