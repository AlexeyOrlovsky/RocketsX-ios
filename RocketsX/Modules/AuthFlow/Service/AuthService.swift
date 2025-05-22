//
//  AuthService.swift
//  RocketsX
//
//  Created by Алексей Орловский on 21.05.2025.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

protocol AuthServiceProtocol {
    func signInWithGoogle() async throws
}

final class AuthService: AuthServiceProtocol {
    func signInWithGoogle() async throws {
        guard let topVC = await topViewController() else {
            throw NSError(domain: "UI", code: -1, userInfo: [NSLocalizedDescriptionKey: "No top view controller"])
        }

        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw NSError(domain: "Firebase", code: -1, userInfo: [NSLocalizedDescriptionKey: "Missing client ID"])
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)

        guard let idToken = result.user.idToken?.tokenString else {
            throw NSError(domain: "GoogleAuth", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve id token"])
        }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: result.user.accessToken.tokenString)

        _ = try await Auth.auth().signIn(with: credential)
    }
}

