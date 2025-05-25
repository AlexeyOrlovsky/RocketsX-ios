//
//  RocketsViewModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import Foundation

private typealias Module = RocketsModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published var state = ViewState()
        
        // MARK: - Private Properties
        private let useCase: RocketsUseCaseProtocol
        
        // MARK: - Helpers
        private var cancellable: CancelBag = .init()
        
        // MARK: - Init
        init(
            useCase: RocketsUseCaseProtocol,
        ) {
            self.useCase = useCase
        }
        
        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
            
            self.fetchRockets()
        }
        
        // MARK: - Public Methods
        func rocket(at index: Int) -> ResponseModels.RocketModel.Rocket? {
            guard state.rockets.indices.contains(index) else { return nil }
            return state.rockets[index]
        }
        
        var rocketsCount: Int {
            state.rockets.count
        }
        
        func signOut() async throws {
            try await useCase.signOut()
        }
    }
}

// MARK: - Private Methods
private extension ViewModel {
    func fetchRockets() {
        Task {
            do {
                let rockets = try await useCase.getRockets()
                await MainActor.run {
                    state.rockets = rockets
                }
            } catch {
                print("Error fetching rockets: \(error)")
            }
        }
    }
}
