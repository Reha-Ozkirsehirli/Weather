//
//  UIView+.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 10.01.2024.
//

import Foundation
import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
