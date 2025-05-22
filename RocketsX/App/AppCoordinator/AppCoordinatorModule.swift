//
//  AppCoordinatorModule.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import SwiftUI
import FlowStacks

// MARK: - MainModule
struct AppCoordinatorModule {
    typealias ViewModelProtocol = AppCoordinatorViewModelProtocol

    @Inject(\.appRoutes) private var appRoutes

    func assemble() -> some View {
        let viewModel: ViewModel = .init(appRoutes: appRoutes)
        return AppCoordinator(viewModel: viewModel)
    }
}

// MARK: - TabBarViewModelProtocol
protocol AppCoordinatorViewModelProtocol: ObservableObject {
    var routes: Binding<Routes<AppScreens>> { get set }
}
