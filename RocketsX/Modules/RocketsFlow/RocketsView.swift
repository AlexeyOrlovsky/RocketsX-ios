//
//  RocketsView.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import UIKit
import SnapKit

private typealias Module = RocketsModule
private typealias View = Module.View

extension Module {
    final class View: UIView {
        // MARK: - UI Elements
        private(set) lazy var tableView: UITableView = build(
            .init(frame: .zero, style: .plain)
        ) {
            $0.register(TableCell.self, forCellReuseIdentifier: TableCell.reuseIdentifier)
            $0.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        }
        // MARK: - Init
        init() {
            super.init(frame: .zero)

            commonSetup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    }
}

// MARK: - Private Methods
private extension View {
    func commonSetup() {
        addSubview(tableView)
        makeConstraints()
    }

    func makeConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
