//
//  FavoriteViewModel.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation

class FavoriteViewModel {
    weak var view: FavoriteViewControllerProtocol!
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
