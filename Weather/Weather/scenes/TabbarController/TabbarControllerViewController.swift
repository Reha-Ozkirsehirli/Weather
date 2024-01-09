//
//  TabbarControllerViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import UIKit

class TabbarControllerViewController: UITabBarController {
    var vm: TabbarControllerViewModel!
    private func setUp() {
        guard let factory = vm.factory else { return }
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        tabBar.standardAppearance = apperance
        tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        let list = factory.weatherList() as! WeatherListViewController
        let favorite = factory.favorite() as! FavoriteViewController
        
        let listViewController = UINavigationController()
        let favoriteViewController = UINavigationController()
        
        listViewController.pushViewController(list, animated: false)
        favoriteViewController.pushViewController(favorite, animated: false)
        
        listViewController.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(named: "weatherIcon"), tag: 0)
        favoriteViewController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "favorite"), tag: 0)
        
        setViewControllers([listViewController, favoriteViewController], animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUp()
    }

}

extension TabbarControllerViewController: TabbarControllerViewControllerProtocol {
    
}
