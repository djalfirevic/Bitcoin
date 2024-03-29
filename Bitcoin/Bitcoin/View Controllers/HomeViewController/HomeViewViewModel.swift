//
//  HomeViewViewModel.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation
import CoreLocation

class HomeViewViewModel {
	
	// MARK: - Properties
	var cities = [
		City(name: "Current Location", latitude: 0.0, longitude: 0.0),
		City(name: "London", latitude: 51.5073509, longitude: -0.1277583),
		City(name: "Tokyo", latitude: 35.709026, longitude: 139.731992)
	]
	var numberOfRows: Int {
		return cities.count
	}
	var forecastDataFetched: (() -> Void)?
	let dispatchGroup = DispatchGroup()
	
	// MARK: - Initializer
	init() {
		configureLocationUpdate()
		fetchForecasts()
	}
	
	// MARK: - Public API
	func cityAt(indexPath: IndexPath) -> City? {
		return cities[indexPath.row]
	}
	
	func fetchForecast(for city: City, completion: @escaping (() -> Void)) {
		RESTManager.shared.GET(from: city.queryString) { [weak self] (_ response: ForecastItem?, _ error: Error?) in
			if let forecast = response {
				var newCity = city
				newCity.forecastItem = forecast
				self?.cities.replaceCity(newCity)
				
				completion()
			}
		}
	}
	
	// MARK: - Private API
	private func configureLocationUpdate() {
		NotificationCenter.default.addObserver(forName: .currentLocationUpdated, object: nil, queue: OperationQueue.main) { [weak self] (notification) in
			if let location = notification.object as? CLLocation {
				if var city = self?.cities.first {
					city.latitude = location.coordinate.latitude
					city.longitude = location.coordinate.longitude
				}
			}
		}
		
		LocationService.shared.startMonitoring()
	}
	
	private func fetchForecasts() {
		cities.forEach { [weak self] in
			self?.dispatchGroup.enter()
			
			fetchForecast(for: $0, completion: {
				self?.dispatchGroup.leave()
			})
		}
		
		dispatchGroup.notify(queue: .main) {
			self.forecastDataFetched?()
		}
	}
	
}
