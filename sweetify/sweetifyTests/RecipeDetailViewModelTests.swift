import XCTest
@testable import sweetify

class RecipeDetailViewModelTests: XCTestCase {
    var viewModel: RecipeDetailViewModel!
    var mockFetcher: MockRecipeFetcher!

    override func setUp() {
        super.setUp()
        mockFetcher = MockRecipeFetcher()
        viewModel = RecipeDetailViewModel(recipeFetcher: mockFetcher)
    }

    override func tearDown() {
        viewModel = nil
        mockFetcher = nil
        super.tearDown()
    }

    
    func testFetchRecipeDetailSuccessfully() async {
        let expectation = XCTestExpectation(description: "Fetching recipes completes")
        
        
        Task {
            await viewModel.findRecipe(id: "52910")
            expectation.fulfill()

        }
        
        await fulfillment(of: [expectation], timeout: 2.0)
                
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertEqual(viewModel.detail?.name, "Chinon Apple Tarts")
    }
    
    func testFetchRecipeDetailError() async {
        let mockFetcher = MockRecipeFetcher()
        mockFetcher.shouldReturnError = true
        let errViewModel = RecipeDetailViewModel(recipeFetcher: mockFetcher)
        
        let expectation = XCTestExpectation(description: "Fetching recipe completes")
        
        Task {
            await errViewModel.findRecipe(id: "52918")
            expectation.fulfill()

        }
        
        await fulfillment(of: [expectation], timeout: 5.0)

        XCTAssertFalse(errViewModel.isLoading)
        XCTAssertNotNil(errViewModel.errorMessage)
    }
}
