//
//  WeatherListAssembly.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation
import Swinject

class WeatherListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherListViewControllerProtocol.self) { r in
            let vc = WeatherListViewController()
            let vm = WeatherListViewModel(apiService: r.resolve(APIServiceProtocol.self)!)
            let factory = r.resolve(ViewControllerFactoryProtocol.self)!
            vm.view = vc
            vm.factory = factory
            vc.vm = vm
            return vc
        }
    }
}
