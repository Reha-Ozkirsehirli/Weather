//
//  WeatherDetailModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation

struct WeatherDetailModel {
    var id: Int
    var city: String
    var country: String
    var latitude: Double
    var longitude: Double
    var temperature: String
    var weatherDescription: String
    var humidity: String
    var windSpeed: String
    var forecast: [Forecast]
    
    struct Forecast {
        var date: String
        var temperature: String
        var weatherDescription: String
        var humidity: String
        var windSpeed: String
    }
}

