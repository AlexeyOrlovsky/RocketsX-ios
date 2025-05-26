//
//  LaunchEntity.swift
//  RocketsX
//
//  Created by Алексей Орловский on 26.05.2025.
//

import SwiftData

@Model
final class LaunchEntity {
    var id: String
    var name: String
    var details: String?
    var dateUtc: String
    var success: Bool?
    var patchSmall: String?
    var article: String?
    var rocketId: String

    init(
        id: String,
        name: String,
        details: String?,
        dateUtc: String,
        success: Bool?,
        patchSmall: String?,
        article: String?,
        rocketId: String
    ) {
        self.id = id
        self.name = name
        self.details = details
        self.dateUtc = dateUtc
        self.success = success
        self.patchSmall = patchSmall
        self.article = article
        self.rocketId = rocketId
    }
}
