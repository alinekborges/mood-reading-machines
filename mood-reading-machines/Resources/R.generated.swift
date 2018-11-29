//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `.swiftlint.yml`.
    static let swiftlintYml = Rswift.FileResource(bundle: R.hostingBundle, name: ".swiftlint", pathExtension: "yml")
    
    /// `bundle.url(forResource: ".swiftlint", withExtension: "yml")`
    static func swiftlintYml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.swiftlintYml
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 5 localization keys.
    struct localizable {
      /// en translation: Another twitter username
      /// 
      /// Locales: en
      static let select_profile_button = Rswift.StringResource(key: "select_profile_button", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Ever wondered what would happen if a robot could read your feelings?
      /// 
      /// Locales: en
      static let onboarding_page1_title = Rswift.StringResource(key: "onboarding_page1_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Here are some suggestions of people to read the mood
      /// 
      /// Locales: en
      static let select_profile_title = Rswift.StringResource(key: "select_profile_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Oh well, we are not that far. Want to see me try it on Twitter?
      /// 
      /// Locales: en
      static let onboarding_page2_title = Rswift.StringResource(key: "onboarding_page2_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      /// en translation: Please enter the @ of any public twitter user
      /// 
      /// Locales: en
      static let enter_username_title = Rswift.StringResource(key: "enter_username_title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
      
      /// en translation: Another twitter username
      /// 
      /// Locales: en
      static func select_profile_button(_: Void = ()) -> String {
        return NSLocalizedString("select_profile_button", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Ever wondered what would happen if a robot could read your feelings?
      /// 
      /// Locales: en
      static func onboarding_page1_title(_: Void = ()) -> String {
        return NSLocalizedString("onboarding_page1_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Here are some suggestions of people to read the mood
      /// 
      /// Locales: en
      static func select_profile_title(_: Void = ()) -> String {
        return NSLocalizedString("select_profile_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Oh well, we are not that far. Want to see me try it on Twitter?
      /// 
      /// Locales: en
      static func onboarding_page2_title(_: Void = ()) -> String {
        return NSLocalizedString("onboarding_page2_title", bundle: R.hostingBundle, comment: "")
      }
      
      /// en translation: Please enter the @ of any public twitter user
      /// 
      /// Locales: en
      static func enter_username_title(_: Void = ()) -> String {
        return NSLocalizedString("enter_username_title", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R {
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
