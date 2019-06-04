//
//  ForecastItem.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct ForecastItem: Codable, CustomStringConvertible {
	
    // MARK: - Properties
    var main: WeatherItem
    var weather: [Weather]
    var wind: Wind
	var clouds: Clouds
	var description: String {
		return "Wind: \(wind.speed) speed\nClouds: \(clouds.all)"
	}
    
}
