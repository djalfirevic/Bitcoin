//
//  BitcoinTests.swift
//  BitcoinTests
//
//  Created by Djuro Alfirevic on 6/3/19.
//  Copyright © 2019 Djuro Alfirevic. All rights reserved.
//

import XCTest
@testable import Bitcoin

class BitcoinTests: XCTestCase {

	// MARK: - Properties
	let api = RESTManager.shared
	
	// MARK: - Tests
	func testCities() {
		// Arrange
		let viewModel = HomeViewViewModel()
		
		// Act/Assert
		XCTAssertTrue(viewModel.numberOfRows == 3, "🛑 Data not correct in HomeViewViewModel.")
	}
	
	func testFetchCityForecast() {
		// Arrange
		let homeViewModel = HomeViewViewModel()
		let london = homeViewModel.cities[1]
		let requestExpectation = expectation(description: "Fetch city forecast.")
		
		// Act
		api.GET(from: london.queryString, completion: { (_response: ForecastItem?, _ error: Error?) in
			requestExpectation.fulfill()
			
			// Assert
			XCTAssertNotNil(_response, "🛑 Fetching forecast failed.")
		})
		
		waitForExpectations(timeout: 5, handler: { (error) in
			if error != nil {
				XCTFail("🛑 Request timed out.")
			}
		})
	}

}
