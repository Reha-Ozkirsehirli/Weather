//
//  ViewControllerFactory.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation
import Swinject

protocol ViewControllerFactoryProtocol {
    func weatherList() -> WeatherListViewControllerProtocol
    func tabbarController() -> TabbarControllerViewControllerProtocol
    func favorite() -> FavoriteViewControllerProtocol
    func detail() -> WeatherDetailViewControllerProtocol
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func weatherList() -> WeatherListViewControllerProtocol {
        assembler.resolver.resolve(WeatherListViewControllerProtocol.self)!
    }

    func tabbarController() -> TabbarControllerViewControllerProtocol {
        assembler.resolver.resolve(TabbarControllerViewControllerProtocol.self)!
    }

    func favorite() -> FavoriteViewControllerProtocol {
        assembler.resolver.resolve(FavoriteViewControllerProtocol.self)!
    }
    
    func detail() -> WeatherDetailViewControllerProtocol {
        assembler.resolver.resolve(WeatherDetailViewControllerProtocol.self)!
    }
}
