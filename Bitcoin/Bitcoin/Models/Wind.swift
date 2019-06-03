//
//  Wind.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import Foundation

struct Wind: Codable {
    
    // MARK: - Properties
    var speed: Float
    var degrees: Float

    // MARK: - Codable
    enum CodingKeys: String, CodingKey {
        case degrees = "deg"
        case speed
    }
    
}
