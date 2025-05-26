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
        
        // MARK: - Private Properties
        @State private var selectedURL: URL?
        @State private var isShowingWebView = false
        
        // MARK: - Public Properties
        
        // MARK: - Body
        var body: some View {
            content()
                .navigationTitle(Localization.title)
                .navigationBarBackButtonHidden(false)
                .onAppear(perform: self.viewModel.onAppear)
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        if viewModel.launches.isEmpty && viewModel.hasLoadedOnce {
            VStack {
                Spacer()
                Text(Localization.noLaunches)
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            List {
                launchesList()
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 8))
                    .listRowSeparator(.visible)
                
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .listStyle(.plain)
            .task {
                if viewModel.launches.isEmpty {
                    await viewModel.loadLaunches()
                }
            }
            .alert(Localization.Alert.error, isPresented: Binding(get: { viewModel.errorMessage != nil }, set: { _ in viewModel.errorMessage = nil })) {
                Button(Localization.Alert.ok, role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
    
    @ViewBuilder func launchesList() -> some View {
        ForEach(viewModel.launches.indices, id: \.self) { index in
            let launch = viewModel.launches[index]
            
            Group {
                if let urlString = launch.links.article,
                   let url = URL(string: urlString),
                   !urlString.isEmpty {
                    NavigationLink(destination: Module.WebView(url: url)) {
                        Module.LaunchRowView(launch: launch)
                    }
                } else {
                    Module.LaunchRowView(launch: launch)
                        .foregroundColor(.gray)
                        .opacity(0.7)
                }
            }
            .onAppear {
                if index == viewModel.launches.count - 1 {
                    Task {
                        await viewModel.loadLaunches()
                    }
                }
            }
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchesModule().assemble(rocketId: "")
    }
}
#endif
