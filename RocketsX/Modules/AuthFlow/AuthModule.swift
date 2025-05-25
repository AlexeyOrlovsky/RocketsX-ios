//
//  AuthFlowModule.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import SwiftUI

// MARK: - AuthModule
struct AuthModule {
    typealias ViewModelProtocol = AuthViewModelProtocol
    
    func assembleSplash() -> some View {
        let service = AuthService()
        let repository = Repository(service: service)
        let useCase = UseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)

        return SplashView(viewModel: viewModel)
    }

    func assembleSignIn() -> some View {
        let service = AuthService()
        let repository = Repository(service: service)
        let useCase = UseCase(repository: repository)
        let viewModel = ViewModel(useCase: useCase)

        return SignInView(viewModel: viewModel)
    }
}

// MARK: - AuthViewModelProtocol
protocol AuthViewModelProtocol: ObservableObject {
    var state: AuthModule.ViewState { get set }
    
    func signIn() async -> Bool
    func onAppear()
}
