//
//  CityViewController.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {

	// MARK: - Properties
	@IBOutlet private weak var windCloudLabel: UILabel!
	var city: City!
	
	// MARK: - View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		fillData()
	}
	
	// MARK: - Private API
	private func fillData() {
		title = city.name
		
		if let forecast = city.forecastItem {
			windCloudLabel.text = forecast.description
		}
	}

}
