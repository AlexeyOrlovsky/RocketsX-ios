//
//  UserDefaultsStore.swift
//  ANYProject
//
//  Created by Vyacheslav on 04.07.2023.
//

import Foundation

public final class UserDefaultsStore: StoreProtocol {
    public init() {}

    private let userDefaults = UserDefaults.standard

    public func get<T>(_ key: String) -> T? where T: Decodable {
        do {
            guard let data = userDefaults.object(forKey: key) as? Data else { return nil }

            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            debugPrint(error.localizedDescription)
            return nil
        }
    }

    public func set<T>(_ value: T?, key: String) where T: Encodable {
        guard let value = value else { return }

        do {
            let data = try JSONEncoder().encode(value)
            userDefaults.set(data, forKey: key)
        } catch let error {
            debugPrint("‼️ Error set to 👮🏻‍♂️: \(error.localizedDescription)")
        }
    }

    public func remove(key: String) {
        userDefaults.removeObject(forKey: key)
    }

    public func clear() {
        userDefaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier ?? "")
        userDefaults.synchronize()
    }
}
