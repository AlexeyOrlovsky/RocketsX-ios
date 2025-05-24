//
//  StoreProtocol.swift
//  NetworkingAlamofireSolution
//
//  Created by Nikita Omelchenko on 19.10.2021.
//

import Foundation

public protocol StoreProtocol: AnyObject {
    func get<T: Decodable>(_ key: String) -> T?
    func set<T: Encodable>(_ value: T?, key: String)
    func remove(key: String)
    func clear()
}
