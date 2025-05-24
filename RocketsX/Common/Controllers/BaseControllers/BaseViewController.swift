//
//  BaseViewController.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import UIKit

class BaseViewController: UIViewController {
    enum Position {
        case left
        case right
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

