//
//  UserSettings.swift
//  DesignPatterns
//
//  Created by Alejandro Robles on 15/08/23.
//

import Foundation

final class UserSettings {
    public static let shared = UserSettings()
    private var settings: [String: Any] = ["Theme": "Vivid", "Brightness": 50]
    private init() { }
    
    public func string(forKey key: String) -> String? {
        return settings[key] as? String
    }
    
    public func int(forKey key: String) -> Int? {
        return settings[key] as? Int
    }
    
    public func set(value: Any, forKey key: String) {
        settings[key] = value
    }
}
