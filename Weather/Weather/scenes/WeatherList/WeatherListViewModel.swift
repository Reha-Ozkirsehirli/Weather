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
    var bundle: Bundle!
    lazy var cellName: String = {
        "WeatherCell"
    }()

    lazy var cellId: String = {
        "WeatherCellId"
    }()

    var elements = [WeatherListModel]()
    private var baseElements = [WeatherListModel]()
    private var models = [WeatherModel]()

    private var apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func fetchData() {
        baseElements.removeAll()
        models.removeAll()
        elements.removeAll()
        apiService.getWeather { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(success):
                success?.forEach({ weatherModel in
                    self.models.append(weatherModel)
                    self.elements.append(.init(id: weatherModel.id,country: weatherModel.country, city: weatherModel.city, temperature: String(Int(weatherModel.temperature)), weatherDescription: weatherModel.weather_description, humidity: String(Int(weatherModel.humidity)), windSpeed: String(weatherModel.wind_speed)))
                })
                self.baseElements.append(contentsOf: self.elements)
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

    private func navigateToDetail(config: WeatherModel) {
        let next = factory.detail() as! WeatherDetailViewController
        next.setConfig(config: config)
        push(next, from: view)
    }
    
    func searchTextDidChange(text: String) {
        if !text.isEmpty {
            let filtered = baseElements.filter { $0.city.contains(text) }
            elements.removeAll()
            elements.append(contentsOf: filtered)
            view.updateTableView()
        } else {
            elements.removeAll()
            elements.append(contentsOf: baseElements)
            view.updateTableView()
        }
    }
    
    func searchCanceled() {
        elements.removeAll()
        elements.append(contentsOf: baseElements)
        view.updateTableView()
    }
}
