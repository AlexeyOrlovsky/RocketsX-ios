//
//  RestAuthService.swift
//  RocketsX
//
//  Created by Алексей Орловский on 25.05.2025.
//

import Foundation
import Firebase
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

private typealias Localization = AppLocale.Auth

protocol AuthServiceProtocol {
    func signInWithGoogle() async throws
    func signOut() throws
}

final class AuthService: AuthServiceProtocol {
    func signInWithGoogle() async throws {
        guard let topVC = await topViewController() else {
            throw NSError(
                domain: Localization.Service.ui, code: -1,
                userInfo: [NSLocalizedDescriptionKey: Localization.Service.noTopVC]
            )
        }

        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw NSError(
                domain: Localization.Service.firebase, code: -1,
                userInfo: [NSLocalizedDescriptionKey: Localization.Service.missingClientID]
            )
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)

        guard let idToken = result.user.idToken?.tokenString else {
            throw NSError(
                domain: Localization.Service.googleAuth, code: -1,
                userInfo: [NSLocalizedDescriptionKey: Localization.Service.failedIDToken]
            )
        }

        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: result.user.accessToken.tokenString)
        _ = try await Auth.auth().signIn(with: credential)
    }
    
    func signOut() throws {
        let firebaseAuth = Auth.auth()

        do {
            try firebaseAuth.signOut()
            GIDSignIn.sharedInstance.signOut()

        } catch let signOutError as NSError {
            throw NSError(
                domain: Localization.Service.googleAuth,
                code: Int(signOutError.code),
                userInfo: [NSLocalizedDescriptionKey: Localization.Service.failedSignOut]
            )
        }
    }
}
