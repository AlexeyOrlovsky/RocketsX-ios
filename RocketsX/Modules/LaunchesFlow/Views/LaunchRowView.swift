//
//  File.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import SwiftUI

private typealias Module = LaunchesModule
private typealias CurrentView = Module.LaunchRowView
private typealias Localization = AppLocale.Launches.Row

extension Module {
    struct LaunchRowView: View {
        // MARK: - Public Properties
        let launch: ResponseModels.LaunchesModel.Launch
        
        // MARK: - Private Properties
        
        // MARK: - Body
        var body: some View {
            content()
                .padding(.vertical, 8)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        HStack(alignment: .top, spacing: 12) {
            AsyncImage(url: URL(string: launch.links.patch?.small ?? "\(AppAssets.xmarkSealFill)")) { image in
                image.resizable()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 50, height: 50)
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(launch.name)
                    .font(.headline)
                
                if let details = launch.details {
                    Text(details)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                
                Text(formattedDate(from: launch.dateUtc))
                    .font(.caption)
                    .foregroundColor(.gray)
                
                HStack {
                    Image(systemName: launch.success == true ? AppAssets.checkmarkSealFill : AppAssets.xmarkSealFill)
                        .foregroundColor(launch.success == true ? .green : .red)
                    Text(launch.success == true ? Localization.success : Localization.failure)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Private Methods
private extension CurrentView {
    private func formattedDate(from isoString: String) -> String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: isoString) else { return isoString }
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        return displayFormatter.string(from: date)
    }
}
