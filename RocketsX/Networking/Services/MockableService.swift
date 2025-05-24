//
//  MockableService.swift
//  RocketsX
//
//  Created by Алексей Орловский on 24.05.2025.
//

import Foundation

protocol MockableService { }

extension MockableService {
    /// 1 second sleep delay
    var sleepTime: UInt64 { 100_000_000_0 }

    func sleepRequest() async throws {
        try await Task.sleep(nanoseconds: sleepTime)
    }
}
