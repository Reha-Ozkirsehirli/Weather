//
//  WeatherDetailContracts.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation

protocol WeatherDetailViewControllerProtocol {
    func setConfig(config: WeatherModel)
    func setButtonImage(isFavorite: Bool)
}
