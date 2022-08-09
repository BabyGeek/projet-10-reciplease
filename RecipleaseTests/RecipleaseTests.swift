//
//  RecipleaseTests.swift
//  RecipleaseTests
//
//  Created by Paul Oggero on 31/07/2022.
//

import XCTest

class RecipleaseTests: XCTestCase {
    var viewModel: RecipeViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        viewModel = RecipeViewModel(service: SearchMockService())
    }
    
    func testGivenNewWhenCheckingShouldBeNilOrEmpty() throws {
        XCTAssertTrue(viewModel.results.isEmpty)
        
        XCTAssertFalse(viewModel.isLoading)

        XCTAssertNil(viewModel.error)
        XCTAssertNil(viewModel.totalResults)
    }
    
    func testGivenIngredientsWhenGetSearchThenResultsShouldCountThree() throws {
        viewModel.fetchData()
        
        XCTAssertEqual(viewModel.results.count, 3)
    }

}
