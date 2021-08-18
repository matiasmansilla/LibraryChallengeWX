//
//  SessionHelper.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 17/08/2021.
//

import Foundation

class SessionHelper {
  
  public static let shared = SessionHelper()
  
  let defaults = UserDefaults.standard
  let sessionDefaultsKey = "SessionHelper.Session"
  
  private init() { }
  
  func saveSession() {
    defaults.set(true, forKey: sessionDefaultsKey)
  }
  
  func deleteSession() {
    defaults.set(false, forKey: sessionDefaultsKey)
  }
  
  
  func isSessionStored() -> Bool {
    return defaults.bool(forKey: sessionDefaultsKey)
  }
  
  func clearAll() {
    defaults.removeObject(forKey: sessionDefaultsKey)
  }

}
