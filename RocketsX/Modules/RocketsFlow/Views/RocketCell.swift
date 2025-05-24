//
//  RocketCell.swift
//  RocketsX
//
//  Created by Алексей Орловский on 23.05.2025.
//

import UIKit
import SnapKit

private typealias Module = RocketsModule
private typealias Cell = Module.TableCell

extension Module {
    final class TableCell: UITableViewCell {
        // MARK: - Private UI
        private lazy var contentStackView: UIStackView = build {
            $0.distribution = .equalSpacing
            $0.spacing = 90
        }

        private lazy var titleLabel: UILabel = build {
            $0.numberOfLines = 1
        }

        private lazy var contentLabel: UILabel = build {
            $0.numberOfLines = 1
        }
        
        // MARK: - Properties
        static let reuseIdentifier = String(describing: TableCell.self)

        // MARK: - Inits
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

            configureSubviews()
            configureConstraints()
        }

        required init?(coder: NSCoder) {
            nil
        }

        // MARK: - Public Methods
        func configure(titleText: String, contentText: String) {
            let clearedContentText = contentText
                .components(separatedBy: .newlines)
                .joined(separator: " ")

            titleLabel.text = titleText
            contentLabel.text = clearedContentText
        }
    }
}

// MARK: - Private Methods
private extension Cell {
    func configureSubviews() {
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(contentLabel)
    }

    func configureConstraints() {
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
}
