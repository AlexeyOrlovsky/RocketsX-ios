//
//  UIApplication+Extension.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import UIKit

@MainActor
func topViewController(
    base: UIViewController? = UIApplication.shared.connectedScenes
        .compactMap { ($0 as? UIWindowScene)?.keyWindow }
        .first?.rootViewController
) async -> UIViewController? {
    
    if let nav = base as? UINavigationController {
        return await topViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
        return await topViewController(base: tab.selectedViewController)
    }
    if let presented = base?.presentedViewController {
        return await topViewController(base: presented)
    }
    return base
}

