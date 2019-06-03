//
//  ForecastItem.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct ForecastItem: Codable {
    
    // MARK: - Properties
    var main: WeatherItem
    var weather: [Weather]
    var wind: Wind
    
}
