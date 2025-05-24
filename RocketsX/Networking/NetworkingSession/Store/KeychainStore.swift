//
//  KeychainStore.swift
//  ANYProject
//
//  Created by Vyacheslav on 04.07.2023.
//

import Foundation
import KeychainAccess

public final class KeychainStore: StoreProtocol {
    public init() {}

    private let keychain = Keychain(service: Bundle.main.bundleIdentifier ?? "")

    public func get<T>(_ key: String) -> T? where T: Decodable {
        do {
            guard let data = try keychain.getData(key) else { return nil }

            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            debugPrint("‼️ Error get value 🔑: \(error.localizedDescription)")
            return nil
        }
    }

    public func set<T>(_ value: T?, key: String) where T: Encodable {
        guard let value = value else { return }

        do {
            let data = try JSONEncoder().encode(value)

            try keychain.set(data, key: key)
        } catch let error {
            debugPrint("‼️ Error set to 🔑: \(error.localizedDescription)")
        }
    }

    public func remove(key: String) {
        do {
            try keychain.remove(key)
        } catch let error {
            debugPrint("‼️ Error remove from 🔑: \(error.localizedDescription)")
        }
    }

    public func clear() {
        do {
            try keychain.removeAll()
        } catch let error {
            debugPrint("‼️ Error remove all 🔑: \(error.localizedDescription)")
        }
    }
}
