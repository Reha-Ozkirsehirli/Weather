//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation

class WeatherDetailViewModel {
    private var apiService: APIServiceProtocol
    private var settingsService: SettingsServiceProtocol
    var view: WeatherDetailViewControllerProtocol!
    var factory: ViewControllerFactoryProtocol!
    var model: WeatherDetailModel!
    var isFavorite: Bool!

    init(apiService: APIServiceProtocol, settingsService: SettingsServiceProtocol) {
        self.apiService = apiService
        self.settingsService = settingsService
    }

    func setConfig(config: WeatherModel) {
        var forcast = [WeatherDetailModel.Forecast]()
        config.forecast.forEach { fc in
            forcast.append(.init(date: fc.date, temperature: String(Int(fc.temperature)), weatherDescription: fc.weather_description, humidity: String(Int(fc.humidity)), windSpeed: String(fc.wind_speed)))
        }
        model = .init(id: config.id, city: config.city, country: config.country, latitude: config.latitude, longitude: config.longitude, temperature: String(Int(config.temperature)), weatherDescription: config.weather_description, humidity: String(Int(config.humidity)), windSpeed: String(config.wind_speed), forecast: forcast)
        isFavorite = settingsService.favorites.contains(model.id)
    }

    func didTapFavorite() {
        if let idx = settingsService.favorites.firstIndex(where: { $0 == model.id }) {
            settingsService.favorites.remove(at: idx)
            isFavorite = false
        } else {
            settingsService.favorites.append(model.id)
            isFavorite = true
        }
        view.setButtonImage(isFavorite: isFavorite)
    }
}
