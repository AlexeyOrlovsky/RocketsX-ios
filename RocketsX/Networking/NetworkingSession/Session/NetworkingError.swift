//
//  NetworkingError.swift
//  ANYProject
//
//  Created Vyacheslav on 04.07.2023.
//

import Foundation

public enum NetworkingError: Error {
    case customError(String)
}

extension NetworkingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .customError(let string):
                return string
        }
    }
}

// MARK: - ServerError
public typealias ServerError = Decodable & Error

// MARK: - ErrorObject
public struct ErrorObject: ServerError {
    let message: String
    let errors: [String: [String]]
}
