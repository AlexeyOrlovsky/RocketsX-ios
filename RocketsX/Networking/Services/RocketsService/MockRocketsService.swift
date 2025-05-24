//
//  MockRocketsService.swift
//  RocketsX
//
//  Created Алексей Орловский on 24.05.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct MockRocketsService: MockableService, RocketsService {
    func getRockets(_ model: RequestModels.Rockets) async throws -> [ResponseModels.RocketModel.Rocket] {
        try await sleepRequest()

        return []
    }
}
