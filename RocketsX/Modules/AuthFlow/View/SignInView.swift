//
//  SignInView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import SwiftUI

private typealias Module = AuthModule
private typealias ModuleView = Module.SignInView
private typealias Localization = AppLocale.Auth

// MARK: - SplashView
extension Module {
    struct SignInView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator
        
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
            if let error = viewModel.state.error {
                Text(error).foregroundColor(.red)
            }
            
            Button(Localization.Signin.googleButtonText) {
                viewModel.signIn()
            }
            
            if viewModel.state.isLoading {
                ProgressView()
            }
        }
        .padding()
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        AuthModule().assembleSignIn()
    }
}
#endif
