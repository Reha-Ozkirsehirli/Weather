//
//  DependencyInjection.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Foundation
import Swinject

class CommonUIAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func assemble(container: Container) {
        container.register(ViewControllerFactoryProtocol.self) { _ in
            ViewControllerFactory(assembler: self.assembler)
        }
    }
}

class CommonAssembly: NSObject, Assembly {
    func assemble(container: Container) {
        container.register(APIServiceProtocol.self) { _ in
            APIService()
        }
        container.register(StorageServiceProtocol.self) { _ in
            StorageService()
        }
    }
}
