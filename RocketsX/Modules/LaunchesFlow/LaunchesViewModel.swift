//
//  LaunchesViewModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation

private typealias Module = LaunchesModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published var state = ViewState()
        @Published var launches: [ResponseModels.LaunchesModel.Launch] = []
        @Published var isLoading = false
        @Published var errorMessage: String?
        @Published var hasLoadedOnce = false
        
        // MARK: - Private Properties
        private let useCase: LaunchesUseCaseProtocol
        
        private var currentPage = 1
        private let limit: Int
        private var canLoadMore = true
        private let rocketId: String
        
        // MARK: - Helpers
        private var cancellable: CancelBag = .init()
        
        // MARK: - Init
        init(
            useCase: LaunchesUseCaseProtocol,
            rocketId: String,
            limit: Int = 10
        ) {
            self.useCase = useCase
            self.rocketId = rocketId
            self.limit = limit
        }
        
        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
        }
        
        // MARK: - Public Methods
        func loadLaunches() async {
            guard !isLoading && canLoadMore else { return }
            isLoading = true
            errorMessage = nil
            
            do {
                let newLaunches = try await useCase.fetchLaunches(for: rocketId, page: currentPage, limit: limit)
                if newLaunches.count < limit {
                    canLoadMore = false
                }
                launches.append(contentsOf: newLaunches)
                currentPage += 1
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.hasLoadedOnce = true
            }
        }
    }
}


