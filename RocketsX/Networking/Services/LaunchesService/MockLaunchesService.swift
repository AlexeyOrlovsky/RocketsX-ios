//
//  MockLaunchesService.swift
//  RocketsX
//
//  Created Алексей Орловский on 25.05.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct MockLaunchesService: MockableService, LaunchesService {
    func getLaunches(rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch] {
        try await sleepRequest()

//        return ResponseModels.LaunchModel.mock
        return []
    }
}
