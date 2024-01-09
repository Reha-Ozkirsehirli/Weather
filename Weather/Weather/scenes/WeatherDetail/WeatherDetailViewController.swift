//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    var vm: WeatherDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension WeatherDetailViewController: WeatherDetailViewControllerProtocol {
    
}
