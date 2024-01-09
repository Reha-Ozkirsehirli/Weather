//
//  WeatherModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation

typealias Weathers = [WeatherModel]
struct WeatherModel: Codable {
    var id: Int
    var city: String
    var country: String
    var latitude: Double
    var longitude: Double
    var temperature: Double
    var weather_description: String
    var humidity: Int
    var wind_speed: Double
    var forecast: [Forecast]
}

struct Forecast: Codable {
    var date: String
    var temperature: Double
    var weather_description: String
    var humidity: Int
    var wind_speed: Double
}
