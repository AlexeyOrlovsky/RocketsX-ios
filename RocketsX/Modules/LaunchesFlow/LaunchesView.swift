//
//  LaunchesView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import SwiftUI
import FirebaseAuth

private typealias Module = LaunchesModule
private typealias ModuleView = Module.MainView
private typealias Localization = AppLocale.Launches

// MARK: - SplashView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator
        
        // MARK: - Public Properties
        
        // MARK: - Body
        var body: some View {
            content()
                .onAppear(perform: self.viewModel.onAppear)
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        VStack {
            Text("")
        }
        .navigationTitle(Localization.title)
        .navigationBarBackButtonHidden(false)
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesModule().assemble()
    }
}
#endif

