//
//  CancelBag.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Combine

final class CancelBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>() // swiftlint:disable:this strict_fileprivate

    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
