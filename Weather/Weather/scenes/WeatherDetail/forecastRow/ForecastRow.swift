//
//  ForecastRow.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 10.01.2024.
//

import UIKit

class ForecastRow: UIView {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var HumidityValueLabel: UILabel!
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    
    var model: WeatherDetailModel.Forecast? {
        didSet {
            if let model = model {
                dateLabel.text = model.date
                descriptionLabel.text = model.weatherDescription
                temperatureLabel.text = model.temperature + "°"
                HumidityValueLabel.text = model.humidity + "%"
                windSpeedValueLabel.text = model.windSpeed
            }
        }
    }

}
