//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    var vm: WeatherDetailViewModel!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    @IBOutlet weak var forecastStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = vm.model.city
        countryLabel.text = vm.model.country
        temperatureLabel.text = vm.model.temperature + "°"
        descriptionLabel.text = vm.model.weatherDescription
        humidityValueLabel.text = vm.model.humidity + "%"
        windSpeedValueLabel.text = vm.model.windSpeed
        vm.model.forecast.forEach { fc in
            var row: ForecastRow = .fromNib()
            row.model = .init(date: fc.date, temperature: fc.temperature, weatherDescription: fc.weatherDescription, humidity: fc.humidity, windSpeed: fc.windSpeed)
            row.heightAnchor.constraint(equalToConstant: 100).isActive = true
            forecastStackView.addArrangedSubview(row)
        }
    }
}

extension WeatherDetailViewController: WeatherDetailViewControllerProtocol {
    func setConfig(config: WeatherModel) {
        vm.setConfig(config: config)
    }
}
