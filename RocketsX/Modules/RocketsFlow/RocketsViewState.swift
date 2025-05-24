//
//  RocketsViewState.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import Foundation

private typealias Module = RocketsModule

// MARK: - State
extension Module {
    struct ViewState {
        var rockets: [ResponseModels.RocketModel.Rocket] = []
    }
}
