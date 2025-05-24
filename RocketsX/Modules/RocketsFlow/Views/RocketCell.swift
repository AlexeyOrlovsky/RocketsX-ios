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
        // MARK: - StackViews
        private lazy var contentStackView: UIStackView = build {
                $0.axis = .horizontal
                $0.distribution = .fillEqually
                $0.spacing = 16
            }

            private lazy var infoStackView: UIStackView = build {
                $0.axis = .vertical
                $0.alignment = .leading
                $0.spacing = 16
            }

            private lazy var additionallyStackView: UIStackView = build {
                $0.axis = .vertical
                $0.alignment = .trailing
                $0.spacing = 16
            }

        // MARK: - Labels
        private lazy var nameLabel: UILabel = build {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.numberOfLines = 1
        }

        private lazy var dateLabel: UILabel = build {
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .secondaryLabel
            $0.numberOfLines = 1
        }
        
        private lazy var successLabel: UILabel = build {
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .secondaryLabel
            $0.numberOfLines = 1
        }
        
        private lazy var heightLabel: UILabel = build {
            $0.font = .systemFont(ofSize: 16, weight: .bold)
            $0.numberOfLines = 1
        }
        
        private lazy var diameterLabel: UILabel = build {
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .secondaryLabel
            $0.numberOfLines = 1
        }
        
        private lazy var weightLabel: UILabel = build {
            $0.font = .systemFont(ofSize: 14, weight: .medium)
            $0.textColor = .secondaryLabel
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
        func configure(
            nameText: String,
            dateText: String,
            successText: String,
            heightText: String,
            diameterText: String,
            weightText: String
        ) {
            nameLabel.text = nameText
            dateLabel.text = dateText
            successLabel.text = successText
            heightLabel.text = heightText
            diameterLabel.text = diameterText
            weightLabel.text = weightText
        }
    }
}

// MARK: - Private Methods
private extension Cell {
    func configureSubviews() {
        contentView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(infoStackView)
        contentStackView.addArrangedSubview(additionallyStackView)
        
        [nameLabel, dateLabel, successLabel].forEach {
            infoStackView.addArrangedSubview($0)
        }
        
        [heightLabel, diameterLabel, weightLabel].forEach {
            additionallyStackView.addArrangedSubview($0)
        }
    }
    
    func configureConstraints() {
        contentStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }
    }
}
