//
//  AuthViewState.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation

private typealias Module = AuthModule

// MARK: - State
extension Module {
    struct ViewState {
        var isLoading: Bool = false
        var error: String?
    }
}

