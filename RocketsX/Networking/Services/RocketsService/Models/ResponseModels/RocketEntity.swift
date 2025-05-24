//
//  RocketEntity.swift
//  RocketsX
//
//  Created by Алексей Орловский on 24.05.2025.
//

import SwiftData

@Model
final class RocketEntity {
    var id: String
    var name: String
    var firstFlight: String
    var successRate: Int
    var height: Double
    var diameter: Double
    var mass: Double

    init(
        id: String,
        name: String,
        firstFlight: String,
        successRate: Int,
        height: Double,
        diameter: Double,
        mass: Double
    ) {
        self.id = id
        self.name = name
        self.firstFlight = firstFlight
        self.successRate = successRate
        self.height = height
        self.diameter = diameter
        self.mass = mass
    }
}
