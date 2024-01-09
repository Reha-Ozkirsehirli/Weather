//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import UIKit

class WeatherListViewController: UIViewController {
    var vm: WeatherListViewModel!

    @IBOutlet weak var elementsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsTableView.register(UINib(nibName: vm.cellName, bundle: vm.bundle), forCellReuseIdentifier: vm.cellId)
        elementsTableView.dataSource = self
        elementsTableView.delegate = self
        vm.fetchData()
    }
}

extension WeatherListViewController: WeatherListViewControllerProtocol {
    func updateTableView() {
        DispatchQueue.main.async {
            self.elementsTableView.reloadData()
        }
    }
}

extension WeatherListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = elementsTableView.dequeueReusableCell(withIdentifier: vm.cellId) as? WeatherCell {
            cell.model = .init(city: vm.elements[indexPath.row].city, country: vm.elements[indexPath.row].country, temperature: vm.elements[indexPath.row].temperature, weatherDescription: vm.elements[indexPath.row].weatherDescription, humidity: vm.elements[indexPath.row].humidity, windSpeed: vm.elements[indexPath.row].windSpeed)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
}
