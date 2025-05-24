//
//  RocketsView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import UIKit
//import Style

private typealias Module = RocketsModule
private typealias Controller = Module.Controller
//private typealias Localization = AppLocale.

extension Module {
    final class Controller: BaseViewController {
        // MARK: - Dependencies
        private let viewModel: ViewModel
        private let viewOutput: Module.View?
        //        private let navigator: AppFlowNavigator?
        
        // MARK: - Properties
        
        // MARK: - Inits
        init(viewModel: ViewModel) {
            self.viewModel = viewModel
            self.viewOutput = Module.View()
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            nil
        }

        // MARK: - Lifecycle
        override func loadView() {
            super.loadView()
            
            self.view = viewOutput
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            commonSetup()
        }

        override var preferredStatusBarStyle: UIStatusBarStyle {
            .darkContent
        }
    }
}

// MARK: - Private Methods
private extension Controller {
    func commonSetup() {
        viewOutput?.tableView.delegate = self
        viewOutput?.tableView.dataSource = self
    }
}

// MARK: - Controller Input
extension Controller {
    func updateTableView() {
        viewOutput?.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension Controller: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        typealias TableCell = Module.TableCell
        guard let cell: TableCell = tableView.dequeueReusableCell(withIdentifier: TableCell.reuseIdentifier, for: indexPath) as? TableCell
        else { preconditionFailure() }
        cell.configure(
            titleText: "Hello",
            contentText: "Hello",
        )

        return cell
    }
}

// MARK: - UITableViewDelegate
extension Controller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.estimatedSectionHeaderHeight
    }
}
