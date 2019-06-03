//
//  Weather.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    // MARK: - Properties
    var main: String
    var description: String
    var icon: String
    var imageUrl: String {
        return "http://openweathermap.org/img/w/\(icon).png"
    }
    
}
