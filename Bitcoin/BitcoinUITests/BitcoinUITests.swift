//
//  BitcoinUITests.swift
//  BitcoinUITests
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import XCTest

class BitcoinUITests: XCTestCase {

	// MARK: - Properties
	var application: XCUIApplication!
	
	// MARK: - Setup
	override func setUp() {
		continueAfterFailure = false
		application = XCUIApplication()
		application.launch()
		XCUIDevice.shared.orientation = .portrait
	}
	
	// MARK: - Tests
	func testCitiesTableView() {
		let citiesTableView = application.tables[Tests.citiesTableViewIdentifier.rawValue]
		
		XCTAssertTrue(citiesTableView.exists, "The cities table view exists")
	}

}
