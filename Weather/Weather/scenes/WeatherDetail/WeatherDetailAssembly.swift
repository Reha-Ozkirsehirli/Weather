//
//  WeatherDetailAssembly.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation
import Swinject

class WeatherDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(WeatherDetailViewControllerProtocol.self) { r in
            let vc = WeatherDetailViewController()
            let vm = WeatherDetailViewModel(apiService: r.resolve(APIServiceProtocol.self)!)
            let factory = r.resolve(ViewControllerFactoryProtocol.self)!
            vm.view = vc
            vm.factory = factory
            vc.vm = vm
            return vc
        }
    }
}

