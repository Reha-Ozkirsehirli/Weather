//
//  ViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import UIKit

class ViewController: UIViewController {
    var factory: ViewControllerFactoryProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        factory = ViewControllerFactory(assembler: appDelegate.assembler!)
        let next = factory.tabbarController() as! UIViewController
        next.modalPresentationStyle = .fullScreen
        next.modalTransitionStyle = .crossDissolve
        present(next, animated: false)
    }


}

