//
//  FavoriteViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import UIKit

class FavoriteViewController: UIViewController {
    var vm: FavoriteViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoriteViewController: FavoriteViewControllerProtocol {
}
