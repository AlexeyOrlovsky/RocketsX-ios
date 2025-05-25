//
//  AuthViewModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation

private typealias Module = AuthModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published var state = ViewState()
        
        // MARK: - Private Properties
        private let useCase: AuthUseCaseProtocol
        
        // MARK: - Helpers
        private var cancellable: CancelBag = .init()
        
        // MARK: - Init
        init(
            useCase: AuthUseCaseProtocol
        ) {
            self.useCase = useCase
        }
        
        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
        }
        
        // MARK: - Public Methods
        func signIn() async -> Bool {
            await MainActor.run { self.state.isLoading = true }
            
            do {
                try await useCase.signInWithGoogle()
                await MainActor.run {
                    self.state.isLoading = false
                    self.state.error = nil
                }
                return true
            } catch {
                await MainActor.run {
                    self.state.isLoading = false
                    self.state.error = error.localizedDescription
                }
                return false
            }
        }
    }
}

