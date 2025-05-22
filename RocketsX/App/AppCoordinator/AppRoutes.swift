//
//  AppRoutes.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation
import FlowStacks

final class AppRoutes: ObservableObject {
    @Published var routes: Routes<AppScreens> = [.root(.splash)]
}
