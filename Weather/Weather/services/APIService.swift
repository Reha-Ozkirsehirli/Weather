//
//  APIService.swift
//  Weather
//
//  Created by Reha Özkırşehirli on 8.01.2024.
//

import Alamofire
import Foundation

protocol APIServiceProtocol {
    func getWeather(handler: @escaping (Result<Weathers?, Error>) -> Void)
}

class APIService: APIServiceProtocol {
    func getWeather(handler: @escaping (Result<Weathers?, Error>) -> Void) {
        AF.request("https://freetestapi.com/api/v1/weathers").responseDecodable(of: Weathers.self) { response in
            switch response.result {
            case let .success(success):
                handler(.success(success))
            case let .failure(failure):
                handler(.failure(failure))
            }
        }
    }
}
