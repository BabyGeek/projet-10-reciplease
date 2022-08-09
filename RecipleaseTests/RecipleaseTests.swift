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
        XCTAssertTrue(viewModel.ingredients.isEmpty)
        XCTAssertTrue(viewModel.favorites.isEmpty)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.canSearch)

        XCTAssertNil(viewModel.error)
        XCTAssertNil(viewModel.totalResults)
    }
    
    func testGivenNewWhenGetSearchThenResultsShouldCountThree() throws {
        viewModel.fetchData()
        
        XCTAssertEqual(viewModel.results.count, 3)
    }
    
    //func testGivenIngredient

}
