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
    
    private var apiService: APIServiceProtocol
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
}
