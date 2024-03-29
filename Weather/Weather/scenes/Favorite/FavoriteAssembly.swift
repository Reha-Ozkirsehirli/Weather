//
//  FavoriteAssembly.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation
import Swinject

class FavoriteAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FavoriteViewControllerProtocol.self) { r in
            let vc = FavoriteViewController()
            let vm = FavoriteViewModel(apiService: r.resolve(APIServiceProtocol.self)!, settingsService: r.resolve(SettingsServiceProtocol.self)!)
            let factory = r.resolve(ViewControllerFactoryProtocol.self)!
            vm.view = vc
            vm.factory = factory
            vc.vm = vm
            return vc
        }
    }
}
