//
//  AuthUseCase.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation

private typealias Module = AuthModule

protocol AuthUseCaseProtocol {
    func signInWithGoogle() async throws
}

// MARK: - UseCase
extension Module {
    struct UseCase: AuthUseCaseProtocol {
        private let repository: AuthRepositoryProtocol
        
        init(repository: AuthRepositoryProtocol) {
            self.repository = repository
        }
        
        func signInWithGoogle() async throws {
            try await repository.signInWithGoogle()
        }
    }
}
