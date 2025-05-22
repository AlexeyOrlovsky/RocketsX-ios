// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation
import SwiftUI

// swiftlint:disable all
// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum AppLocale {
    // MARK: - Constants

    public enum Constants {
        public static let defaultTable: String = "Localizable"
    }

    private static var currentLocalize: LocalizeKeys = .english

    public static var currentLanguageCode: String { currentLocalize.code }


  public enum Auth {
    public enum Service {
        /// Failed to retrieve id token
        public static var failedIDToken: String { AppLocale.tr("Localize", "auth.service.failedIDToken") }
        /// Firebase
        public static var firebase: String { AppLocale.tr("Localize", "auth.service.firebase") }
        /// GoogleAuth
        public static var googleAuth: String { AppLocale.tr("Localize", "auth.service.googleAuth") }
        /// Missing client ID
        public static var missingClientID: String { AppLocale.tr("Localize", "auth.service.missingClientID") }
        /// No top view controller
        public static var noTopVC: String { AppLocale.tr("Localize", "auth.service.noTopVC") }
        /// UI
        public static var ui: String { AppLocale.tr("Localize", "auth.service.ui") }
    }
    public enum Signin {
        /// Sign in with Google
        public static var googleButtonText: String { AppLocale.tr("Localize", "auth.signin.googleButtonText") }
    }
    public enum Splash {
        /// Authenticated
        public static var authenticated: String { AppLocale.tr("Localize", "auth.splash.authenticated") }
        /// Checking session...
        public static var progressText: String { AppLocale.tr("Localize", "auth.splash.progressText") }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

public extension AppLocale {
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let path = Bundle(for: BundleToken.self).path(forResource: AppLocale.currentLanguageCode, ofType: "lproj")
        let bundle = Bundle(path: path!) ?? Bundle(for: BundleToken.self)
        let format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
    static func tr(_ key: String) -> String {
        tr(Constants.defaultTable, key)
    }
}

private final class BundleToken {}
// swiftlint:enable all