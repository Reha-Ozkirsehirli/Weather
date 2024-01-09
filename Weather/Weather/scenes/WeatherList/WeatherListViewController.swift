//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import UIKit

class WeatherListViewController: UIViewController {
    var vm: WeatherListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WeatherListViewController: WeatherListViewControllerProtocol {
}
