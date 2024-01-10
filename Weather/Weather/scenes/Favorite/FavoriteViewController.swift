//
//  FavoriteViewController.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 9.01.2024.
//

import UIKit

class FavoriteViewController: UIViewController {
    var vm: FavoriteViewModel!

    @IBOutlet var elementsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        elementsTableView.register(UINib(nibName: vm.cellName, bundle: vm.bundle), forCellReuseIdentifier: vm.cellId)
        elementsTableView.dataSource = self
        elementsTableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        vm.fetchData()
    }
}

extension FavoriteViewController: FavoriteViewControllerProtocol {
    func updateTableView() {
        DispatchQueue.main.async {
            self.elementsTableView.reloadData()
        }
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vm.didSelectRow(row: indexPath.row)
    }
}
