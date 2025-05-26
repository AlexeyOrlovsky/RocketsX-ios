//
//  ReqLaunchesQueryModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

extension RequestModels {
    struct LaunchesQuery: Encodable {
        let query: Query
        let options: Options

        struct Query: Encodable {
            let rocket: String
        }

        struct Options: Encodable {
            let page: Int
            let limit: Int
            let sort: [String: String]
        }
    }
}


