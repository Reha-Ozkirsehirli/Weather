//
//  TabbarControllerAssembly.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import Foundation
import Swinject

class TabbarControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabbarControllerViewControllerProtocol.self) { r in
            let vc = TabbarControllerViewController()
            let vm = TabbarControllerViewModel()
            let factory = r.resolve(ViewControllerFactoryProtocol.self)!
            vm.view = vc
            vm.factory = factory
            vc.vm = vm
            return vc
        }
    }
}
