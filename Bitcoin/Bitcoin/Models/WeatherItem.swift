//
//  WeatherItem.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct WeatherItem: Codable {
    
    // MARK: - Properties
    var pressure: Double
    var humidity: Int
    var temperature: Double
    var minimumTemperature: Double?
    var maximumTemperature: Double?
	
    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }
    
}
