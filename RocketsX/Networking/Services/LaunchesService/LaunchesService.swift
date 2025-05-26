//
//  LaunchesService.swift
//  RocketsX
//
//  Created Алексей Орловский on 25.05.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

protocol LaunchesService {
    func getLaunches(rocketId: String, page: Int, limit: Int) async throws -> [ResponseModels.LaunchesModel.Launch]
}

extension RequestRouter {
    enum Launches {
        case launches(RequestModels.LaunchesQuery)
    }
}

extension RequestRouter.Launches: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
        case .launches:
            return "/v5/launches/query"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .launches:
            return .post
        }
    }
    
    var parameters: Encodable? {
        switch self {
        case .launches(let model):
            return model
        }
    }
    
    var addAuth: Bool {
        switch self {
        case .launches:
            return false
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    var withSnakeStyleEncoder: Bool {
        return false
    }
}
