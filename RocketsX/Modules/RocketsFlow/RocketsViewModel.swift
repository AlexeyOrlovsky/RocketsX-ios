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
        
        // MARK: - Services
//        private let rocketsService: RocketsService
        
        // MARK: - Init
        init(
            useCase: RocketsUseCaseProtocol,
//            rocketsService: RocketsService
        ) {
            self.useCase = useCase
//            self.rocketsService = rocketsService
        }
        
        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
            
            self.fetchRockets()
        }
        
        // MARK: - Public Methods
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
        
        func rocket(at index: Int) -> ResponseModels.RocketModel.Rocket? {
            guard state.rockets.indices.contains(index) else { return nil }
            return state.rockets[index]
        }
        
        var rocketsCount: Int {
            state.rockets.count
        }
    }
}
