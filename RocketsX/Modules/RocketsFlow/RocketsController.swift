//
//  RocketsView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import UIKit
import Combine

private typealias Module = RocketsModule
private typealias Controller = Module.Controller
//private typealias Localization = AppLocale.

extension Module {
    final class Controller: BaseViewController {
        // MARK: - Dependencies
        private let viewModel: ViewModel
        private let viewOutput: Module.View?
        
        // MARK: - Properties
        private var cancellable: CancelBag = .init()
        
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

            bindViewModel()
            self.viewModel.onAppear()
            commonSetup()
        }
        
        override var preferredStatusBarStyle: UIStatusBarStyle {
            .darkContent
        }
        
        private func bindViewModel() {
            viewModel.$state
                .map(\.rockets)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    self?.updateTableView()
                }
                .store(in: cancellable)
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
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.rocketsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        typealias TableCell = Module.TableCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.reuseIdentifier, for: indexPath) as? TableCell,
              let rocket = viewModel.rocket(at: indexPath.row) else {
            preconditionFailure()
        }
        
        cell.configure(
            nameText: "Name: \(rocket.name)",
            dateText: "Date: \(rocket.firstFlight)",
            successText: "Success: \(rocket.successRatePct)",
            heightText: "\(rocket.height.meters ?? 0) HT",
            diameterText: "\(rocket.diameter.meters ?? 0) ⌀",
            weightText: "\(rocket.mass.kg) kg"
        )
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension Controller: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.estimatedSectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
