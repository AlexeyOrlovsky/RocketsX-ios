//
//  BaseRestService.swift
//  ANYProject
//
//  Created Vyacheslav on 04.07.2023.
//

public protocol BaseRestService {
    var restClient: NetworkingSessionProtocol { get }
}
