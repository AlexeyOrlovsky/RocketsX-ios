//
//  SplashView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import SwiftUI
import FirebaseAuth

private typealias Module = AuthModule
private typealias ModuleView = Module.SplashView
private typealias Localization = AppLocale.Auth

// MARK: - SplashView
extension Module {
    struct SplashView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator
        
        // MARK: - Public Properties
        @State private var isAuthenticated = false
        @State private var checkedSession = false
        @State private var didPushAuth = false
        @State private var shouldShowSignIn = false
        
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
        if !checkedSession {
            ProgressView(Localization.Splash.progressText)
                .onAppear {
                    Task {
                        try? await Task.sleep(nanoseconds: 2_000_000_000)
                        isAuthenticated = Auth.auth().currentUser != nil
                        checkedSession = true
                    }
                }
        } else if isAuthenticated {
            //
            Text(Localization.Splash.authenticated)
        } else {
            Module.SignInView.init(viewModel: viewModel)
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        AuthModule().assembleSplash()
    }
}
#endif
