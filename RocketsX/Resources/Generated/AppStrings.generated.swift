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
        /// Failed to log out of account
        public static var failedSignOut: String { AppLocale.tr("Localize", "auth.service.failedSignOut") }
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

  public enum Launches {
      /// No launches
      public static var noLaunches: String { AppLocale.tr("Localize", "launches.noLaunches") }
      /// Launches
      public static var title: String { AppLocale.tr("Localize", "launches.title") }
    public enum Alert {
        /// Error
        public static var error: String { AppLocale.tr("Localize", "launches.alert.error") }
        /// Ok
        public static var ok: String { AppLocale.tr("Localize", "launches.alert.ok") }
    }
    public enum Row {
        /// Failure
        public static var failure: String { AppLocale.tr("Localize", "launches.row.failure") }
        /// Success
        public static var success: String { AppLocale.tr("Localize", "launches.row.success") }
    }
  }

  public enum Rockets {
      /// Sign Out
      public static var signOut: String { AppLocale.tr("Localize", "rockets.signOut") }
      /// Rockets List
      public static var title: String { AppLocale.tr("Localize", "rockets.title") }
    public enum Cell {
        /// Date: 
        public static var date: String { AppLocale.tr("Localize", "rockets.cell.date") }
        ///  ⌀
        public static var diameter: String { AppLocale.tr("Localize", "rockets.cell.diameter") }
        ///  HT
        public static var ht: String { AppLocale.tr("Localize", "rockets.cell.ht") }
        ///  kg
        public static var kg: String { AppLocale.tr("Localize", "rockets.cell.kg") }
        /// Name: 
        public static var name: String { AppLocale.tr("Localize", "rockets.cell.name") }
        /// Success: 
        public static var success: String { AppLocale.tr("Localize", "rockets.cell.success") }
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