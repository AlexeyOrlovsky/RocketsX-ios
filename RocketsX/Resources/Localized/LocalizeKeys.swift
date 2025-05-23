//
//  LocalizeKeys.swift
//  RocketsX
//
//  Created by Алексей Орловский on 22.05.2025.
//

import Foundation

enum LocalizeKeys: String, CaseIterable {
    case english = "en"

    var code: String { self.rawValue }

    var title: String {
        switch self {
            case .english:
                return "English"
        }
    }

    var locale: Locale {
        switch self {
            case .english:
                return .init(identifier: "en_US")
        }
    }

    static func getLocalize(title: String) -> Self {
        switch title {
            case Self.english.title:
                return Self.english
            default:
                return Self.english
        }
    }
}
