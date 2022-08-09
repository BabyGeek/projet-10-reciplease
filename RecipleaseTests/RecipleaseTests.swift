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
    
    func testGivenNewViewModelWhenGetSearchThenResultsShouldCountThree() throws {
        viewModel.fetchData()
        
        XCTAssertEqual(viewModel.results.count, 3)
    }
    
    func testGivenIngredientsWhenGetSearchThenResultsShouldCountThree() throws {
        let ingredients = [
        Ingredient(name: "Eggs")
        ]
        viewModel.fetchData(ingredients)
        
        XCTAssertEqual(viewModel.results.count, 3)
    }
    
    func testGivenNewWhenValidateEmptyAlimentShouldBeFalseAndErrorShouldBeNotNill() throws {
        XCTAssertFalse(viewModel.isValidIngredient(""))
        XCTAssertNotNil(viewModel.error)
    }
    
    func testGivenNewWhenValidateNotEmptyAlimentShouldBeTrue() throws {
        XCTAssertTrue(viewModel.isValidIngredient("Eggs"))
    }
    
    func testGivenRecipeMockWhenGetInformationsShouldEqualMockHardInformations() throws {
        let recipe = Recipe.mock
        
        XCTAssertEqual(recipe.getTime(), "00h03")
        XCTAssertEqual(recipe.getCalories(), "2871")
        
        
        XCTAssertEqual(recipe.getCuisineType(), "mediterranean")
        XCTAssertEqual(recipe.getMealType(), "lunch/dinner")
        XCTAssertEqual(recipe.getDishType(), "sandwiches")
        
        XCTAssertFalse(recipe.getIngredients().isEmpty)

    }
    
    func testGivenRecipeEmptyStringsWhenGetInformationsShouldEqualMockHardInformations() throws {
        let recipe = Recipe(uri: "", totalTime: 635, calories: 0, label: "", ingredientLines: [String](), image: "", url: "", cuisineType: nil, mealType: nil, dishType: nil)
        
        XCTAssertEqual(recipe.getTime(), "10h35")
        XCTAssertEqual(recipe.getCalories(), "0")
        
        
        XCTAssertEqual(recipe.getCuisineType(), "N/A")
        XCTAssertEqual(recipe.getMealType(), "N/A")
        XCTAssertEqual(recipe.getDishType(), "N/A")
        
        XCTAssertTrue(recipe.getIngredients().isEmpty)
    }
    
    func testGivenJSONSearchWhenParsingSearchResponseThenCountShouldBe20() throws {
        let url = Bundle.main.path(forResource: "search", ofType: "json")!
        let jsonData = try! String(contentsOfFile: url).data(using: .utf8)!
        let searchResponse = try! JSONDecoder().decode(SearchResponse.self, from: jsonData)
        
        XCTAssertEqual(searchResponse.from, 1)
        XCTAssertEqual(searchResponse.to, 20)
        XCTAssertEqual(searchResponse.count, 10000)
        
        XCTAssertFalse(searchResponse.hits.isEmpty)
    }
    
    func testGivenAppErrorsCRUDWhenGetDescriptionShouldBeEqualObjectDescription() throws {
        let emptyIngredient = AppError(error: CRUDError.emptyIngredient)
        let alreadyInUse = AppError(error: CRUDError.alreadyInUse)
        let emptySearch = AppError(error: CRUDError.emptySearch)
        
        XCTAssertEqual(emptyIngredient.getDescription(), CRUDError.emptyIngredient.errorDescription!)
        XCTAssertEqual(alreadyInUse.getDescription(), CRUDError.alreadyInUse.errorDescription!)
        XCTAssertEqual(emptySearch.getDescription(), CRUDError.emptySearch.errorDescription!)
    }
}
