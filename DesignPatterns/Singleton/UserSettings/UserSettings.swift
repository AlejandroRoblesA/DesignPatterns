//
//  UserSettings.swift
//  DesignPatterns
//
//  Created by Alejandro Robles on 15/08/23.
//

import Foundation

final class UserSettings {
    public static let shared: UserSettings = UserSettings()
    private var settings: [String: Any] = ["Theme": "Vivid", "Brightness": 50]
    private let serialQueue: DispatchQueue = DispatchQueue(label: "serialQueue")
    
    private init() { }
    
    public func string(forKey key: String) -> String? {
        var result: String?
        serialQueue.sync { [weak self] in
            guard let self = self else { return }
            result = self.settings[key] as? String
        }
        return result
    }
    
    public func int(forKey key: String) -> Int? {
        var result: Int?
        serialQueue.sync { [weak self] in
            guard let self = self else { return }
            result = self.settings[key] as? Int
        }
        return result
    }
    
    public func set(value: Any, forKey key: String) {
        serialQueue.sync { [weak self] in
            guard let self = self else { return }
            self.settings[key] = value
        }
    }
}
