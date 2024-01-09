//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Combine
import Foundation

class WeatherListViewModel {
    weak var view: WeatherListViewControllerProtocol!
    var factory: ViewControllerFactoryProtocol!

    private var apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func navigateToDetail() {
        var next = factory.detail() as! WeatherDetailViewController
        push(next, from: view)
    }
}
