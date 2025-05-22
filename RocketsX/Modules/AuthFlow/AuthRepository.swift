//
//  AuthRepository.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation

private typealias Module = AuthModule

protocol AuthRepositoryProtocol {
    func signInWithGoogle() async throws
}

// MARK: - Repository
extension Module {
    struct Repository: AuthRepositoryProtocol {
        private let service: AuthServiceProtocol
        
        init(service: AuthServiceProtocol) {
            self.service = service
        }
        
        func signInWithGoogle() async throws {
            try await service.signInWithGoogle()
        }
    }
}
