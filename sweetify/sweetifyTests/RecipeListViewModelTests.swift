import XCTest
@testable import sweetify  // Ensure this is imported

final class RecipesListViewModelTests: XCTestCase {
    var viewModel: RecipesListViewModel!
    var mockFetcher: MockRecipeFetcher!

    override func setUp() {
        super.setUp()
        mockFetcher = MockRecipeFetcher()
        viewModel = RecipesListViewModel(recipeFetcher: mockFetcher)
    }

    override func tearDown() {
        viewModel = nil
        mockFetcher = nil
        super.tearDown()
    }

    func testFetchRecipesSuccessfully() async {
        let expectation = XCTestExpectation(description: "Fetching recipes completes")
        
        Task {
            await viewModel.getRecipes()
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 1.0)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.recipes.count, 3)
        XCTAssertEqual(viewModel.recipes.first?.name, "Chinon Apple Tarts")
    }
    
    func testFetchRecipesError() async {
        let mockFetcher = MockRecipeFetcher()
        mockFetcher.shouldReturnError = true
        let viewModel = RecipesListViewModel(recipeFetcher: mockFetcher)
        
        let expectation = XCTestExpectation(description: "Fetching recipes completes")
        
        Task {
            await viewModel.getRecipes()
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 1.0)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.errorMessage)
    }
}
