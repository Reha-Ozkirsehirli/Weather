//
//  FavoriteViewModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation

class FavoriteViewModel {
    private var apiService: APIServiceProtocol
    private var settingsService: SettingsServiceProtocol
    weak var view: FavoriteViewControllerProtocol!
    var factory: ViewControllerFactoryProtocol!
    var bundle: Bundle!
    lazy var cellName: String = {
        "WeatherCell"
    }()

    lazy var cellId: String = {
        "WeatherCellId"
    }()

    var elements = [WeatherListModel]()
    private var models = [WeatherModel]()

    init(apiService: APIServiceProtocol, settingsService: SettingsServiceProtocol) {
        self.apiService = apiService
        self.settingsService = settingsService
    }
    
    func fetchData() {
        models.removeAll()
        elements.removeAll()
        apiService.getWeather { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(success):
                success?.forEach({ weatherModel in
                    if self.settingsService.favorites.contains(where: { $0 == weatherModel.id }) {
                        self.models.append(weatherModel)
                        self.elements.append(.init(id: weatherModel.id,country: weatherModel.country, city: weatherModel.city, temperature: String(Int(weatherModel.temperature)), weatherDescription: weatherModel.weather_description, humidity: String(Int(weatherModel.humidity)), windSpeed: String(weatherModel.wind_speed)))
                    }
                })
                self.view.updateTableView()
            case let .failure(failure):
                print("WeatherListViewModel: Failure", failure)
            }
        }
    }
    
    func didSelectRow(row: Int) {
        let id = elements[row].id
        if let model = models.first(where: { $0.id == id }) {
            navigateToDetail(config: model)
        }
    }
    
    func navigateToDetail(config: WeatherModel) {
        let next = factory.detail() as! WeatherDetailViewController
        next.setConfig(config: config)
        push(next, from: view)
    }
}
