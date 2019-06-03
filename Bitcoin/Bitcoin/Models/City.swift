//
//  City.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct City {
    
    // MARK: - Properties
    var name: String
    var latitude: Double
    var longitude: Double
	var queryString: String {
		return "lat=\(latitude)&lon=\(longitude)"
	}
	var forecastItem: ForecastItem?
	var imageUrl: String? {
		guard let forecast = forecastItem, let weather = forecast.weather.first else { return nil }
		
		return weather.imageUrl
	}
	
	// MARK: - Initializer
	init(name: String, latitude: Double, longitude: Double) {
		self.name = name
		self.latitude = latitude
		self.longitude = longitude
	}
	
}
