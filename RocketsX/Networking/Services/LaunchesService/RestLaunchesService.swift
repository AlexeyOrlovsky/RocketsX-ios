//
//  RestLaunchesService.swift
//  RocketsX
//
//  Created Алексей Орловский on 25.05.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct RestLaunchesService: BaseRestService {
    let restClient: NetworkingSessionProtocol
}

extension RestLaunchesService: LaunchesService {
    func getLaunches(rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch] {
        let requestModel = RequestModels.LaunchesQuery(
            query: .init(rocket: rocketId),
            options: .init(
                page: page,
                limit: limit,
                sort: ["date_utc": "desc"]
            )
        )

        let request = try restClient.tryRequest(RequestRouter.Launches.launches(requestModel))
        let response = await request.asyncResponseData()
        let result: Result<ResponseModels.LaunchesModel, Error> = restClient.responseData(response)

        switch result {
        case .success(let launches):
            return launches.docs
        case .failure(let error):
            throw error
        }
    }
}
