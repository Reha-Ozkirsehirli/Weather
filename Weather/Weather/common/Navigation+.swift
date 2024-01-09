//
//  Navigation+.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation
import UIKit

func push<T, E>(_ view: T, from source: E?) {
    guard let source = source as? UIViewController,
          let destination = view as? UIViewController else { return }
    DispatchQueue.main.async {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
