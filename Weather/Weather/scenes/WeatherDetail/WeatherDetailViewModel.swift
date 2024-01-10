//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation

class WeatherDetailViewModel {
    var view: WeatherDetailViewControllerProtocol!
    var factory: ViewControllerFactoryProtocol!
    var model: WeatherDetailModel!

    private var apiService: APIServiceProtocol
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func setConfig(config: WeatherModel) {
        var forcast = [WeatherDetailModel.Forecast]()
        config.forecast.forEach { fc in
            forcast.append(.init(date: fc.date, temperature: String(fc.temperature), weatherDescription: fc.weather_description, humidity: String(fc.humidity), windSpeed: String(fc.wind_speed)))
        }
        model = .init(id: config.id, city: config.city, country: config.country, latitude: config.latitude, longitude: config.longitude, temperature: String(Int(config.temperature)), weatherDescription: config.weather_description, humidity: String(Int(config.humidity)), windSpeed: String(config.wind_speed), forecast: forcast)
    }
}
