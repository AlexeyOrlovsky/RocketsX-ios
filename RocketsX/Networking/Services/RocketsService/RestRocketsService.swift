//
//  RestRocketsService.swift
//  RocketsX
//
//  Created Алексей Орловский on 24.05.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct RestRocketsService: BaseRestService {
    let restClient: NetworkingSessionProtocol
}

extension RestRocketsService: RocketsService {
    func getRockets(_ model: RequestModels.Rockets) async throws -> [ResponseModels.RocketModel.Rocket] {
        let request = try restClient.tryRequest(RequestRouter.Rockets.rockets)
        let response = await request.asyncResponseData()
        let result: Result<[ResponseModels.RocketModel.Rocket], Error> = restClient.responseData(response)
        
        switch result {
        case .success(let rockets):
            return rockets
        case .failure(let error):
            throw error
        }
    }
}
