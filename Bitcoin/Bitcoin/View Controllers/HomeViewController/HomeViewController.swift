//
//  HomeViewController.swift
//  Bitcoin
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

	// MARK: - Properties
	@IBOutlet private weak var tableView: UITableView!
	let viewModel = HomeViewViewModel()
	
	// MARK: - View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureTableView()
		viewModel.forecastDataFetched = { [weak self] in
			self?.tableView.reloadData()
		}
	}
	
	// MARK: - Private API
	private func configureTableView() {
		tableView.tableFooterView = UIView()
		tableView.accessibilityIdentifier = Tests.citiesTableViewIdentifier.rawValue
		
		tableView.reloadData()
	}

	private func showCity(_ city: City) {
		let storyboard = UIStoryboard(name: Storyboards.main.rawValue, bundle: Bundle.main)
		
		if let toViewController = storyboard.instantiateViewController(withIdentifier: CityViewController.identifier) as? CityViewController {
			toViewController.city = city
			navigationController?.pushViewController(toViewController, animated: true)
		}
	}
	
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
	
	// MARK: - UITableViewDataSource
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as? CityTableViewCell else {
			fatalError("\(CityTableViewCell.identifier) not properly initialized.")
		}
		
		cell.city = viewModel.cityAt(indexPath: indexPath)
		
		return cell
	}
	
	// MARK: - UITableViewDelegate
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
		if let city = viewModel.cityAt(indexPath: indexPath) {
			showCity(city)
		}
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.transform = CGAffineTransform(translationX: 0, y: 50)
		cell.alpha = 0.0
		
		UIView.animate(withDuration: Animations.animationDuration.rawValue, delay: Animations.animationDelay.rawValue * Double(indexPath.row), options: [.curveEaseInOut], animations: {
			cell.transform = CGAffineTransform(translationX: 0, y: 0)
			cell.alpha = 1.0
		})
	}
	
}
