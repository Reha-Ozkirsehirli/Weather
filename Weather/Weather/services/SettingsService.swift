//
//  SettingsService.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 10.01.2024.
//

import Foundation

protocol SettingsServiceProtocol {
    var favorites: [Int] { get set }
}

class SettingsService: SettingsServiceProtocol {
    let defaults: UserDefaults
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    var favorites: [Int] {
        get {
            if let values = defaults.object(forKey: UDKey.favorites) as? [Int] {
                return values
            } else {
                return [Int]()
            }
        }

        set {
            defaults.set(newValue, forKey: UDKey.favorites)
        }
    }

}

struct UDKey {
    static let favorites = "favorites"
}
