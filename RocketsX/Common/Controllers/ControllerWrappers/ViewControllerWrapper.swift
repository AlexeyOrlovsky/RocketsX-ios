//
//  ControllerWrapperView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 24.05.2025.
//

import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    let controller: UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
