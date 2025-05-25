//
//  AppCoordinatorViewModel.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import SwiftUI
import FlowStacks

typealias AppScreens = AppCoordinatorModule.ViewModel.Screen
typealias AppFlowNavigator = FlowNavigator<AppScreens>

private typealias Module = AppCoordinatorModule
private typealias ViewModel = Module.ViewModel

// MARK: - AppVMCoordinatorViewModel
extension Module {
    class ViewModel: ObservableObject, ViewModelProtocol {
        // MARK: - Screen
        enum Screen {
            case splash
            case signIn
            case rockets
            case launches
        }

        // MARK: - Public Properties
        var routes: Binding<Routes<Screen>>

        // MARK: - Private Properties
        @Published private var appRoutes: AppRoutes
        
        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(
            appRoutes: AppRoutes
        ) {
            self.appRoutes = appRoutes
            self.routes = .init {
                appRoutes.routes
            } set: { value in
                appRoutes.routes = value
            }
            
           self.configureObserving()
        }
    }
}

// MARK: - Private Methods
private extension ViewModel {
    func configureObserving() {
        self.appRoutes.$routes
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: cancellable)
    }
}
