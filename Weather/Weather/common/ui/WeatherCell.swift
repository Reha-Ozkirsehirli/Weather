//
//  WeatherCell.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    var model: WeatherCellModel? {
        didSet {
            if let model = model {
                cityLabel.text = model.city
                countryLabel.text = model.country
                temperatureLabel.text = model.temperature + "°"
                weatherDescriptionLabel.text = model.weatherDescription
                humidityValueLabel.text = model.humidity + "%"
                windSpeedValueLabel.text = model.windSpeed
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSizeMake(0, 0)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.33
        view.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
