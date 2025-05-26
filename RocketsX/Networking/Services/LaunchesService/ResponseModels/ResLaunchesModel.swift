//
//  ResLaunchesModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

extension ResponseModels {
    struct LaunchesModel: Codable {
        let docs: [Launch]

        struct Launch: Equatable, Codable {
            let name: String
            let details: String?
            let dateUtc: String
            let success: Bool?
            let links: Links

            struct Links: Equatable, Codable {
                let patch: Patch?
                let article: String?

                struct Patch: Equatable, Codable {
                    let small: String?
                }
            }
        }
    }
}

extension ResponseModels.LaunchesModel.Launch {
    init(from entity: LaunchEntity) {
        self.init(
            name: entity.name,
            details: entity.details,
            dateUtc: entity.dateUtc,
            success: entity.success,
            links: .init(
                patch: .init(small: entity.patchSmall),
                article: entity.article
            )
        )
    }
}
