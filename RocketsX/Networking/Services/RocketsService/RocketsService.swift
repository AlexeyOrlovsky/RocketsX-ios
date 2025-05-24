//
//  RocketsService.swift
//  RocketsX
//
//  Created Алексей Орловский on 24.05.2025.
//  Copyright © 2025 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

protocol RocketsService {
    func getRockets(_ model: RequestModels.Rockets) async throws -> [ResponseModels.RocketModel.Rocket]
}

extension RequestRouter {
    enum Rockets {
        case rockets
    }
}

extension RequestRouter.Rockets: NetworkingRouterProtocol {
    var path: Endpoint {
        switch self {
        case .rockets:
            return "/v4/rockets"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .rockets:
            return .get
        }
    }
    
    var parameters: Encodable? {
        switch self {
        case .rockets:
            return nil
        }
    }

    var addAuth: Bool {
        switch self {
            case .rockets:
                return false
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .rockets:
            return nil
        }
    }
    
    var withSnakeStyleEncoder: Bool {
        switch self {
        case .rockets:
            return false
        }
    }
}
