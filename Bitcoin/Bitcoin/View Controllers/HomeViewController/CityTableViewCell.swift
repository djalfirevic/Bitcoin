//
//  CityTableViewCell.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

	// MARK: - Properties
	@IBOutlet private weak var weatherIconImageView: UIImageView!
	@IBOutlet private weak var cityLabel: UILabel!
	var city: City? {
		didSet {
			guard let city = city else { return }
			
			if let forecast = city.forecastItem {
				cityLabel.text = "\(city.name), \(forecast.main.temperature) F"
			} else {
				cityLabel.text = city.name
			}
			
			if let imageUrl = city.imageUrl {
				weatherIconImageView.loadImage(from: imageUrl)
			}
		}
	}

}
