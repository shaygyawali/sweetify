import Foundation
@testable import sweetify

class MockRecipeFetcher: RecipeFetching {
    var shouldReturnError = false

    func fetchRecipes() async throws -> [RecipeSummary] {
        if shouldReturnError {
            throw NSError(domain: "MockErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Mock error occurred"])
        }
        
        return [
            RecipeSummary(name: "Chinon Apple Tarts", thumbnail: "https://www.themealdb.com/images/media/meals/qtqwwu1511792650.jpg", id: "52910"),
            RecipeSummary(name: "Choc Chip Pecan Pie", thumbnail: "https://www.themealdb.com/images/media/meals/rqvwxt1511384809.jpg", id: "52856"),
            RecipeSummary(name: "Chocolate Avocado Mousse", thumbnail: "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg", id: "52853")
        ]
    }
    
    
    func fetchRecipe(idMeal: String) async throws -> RecipeDetail {
        switch idMeal {
        case "52910":
            return RecipeDetail(
                idMeal: "52910",
                name: "Chinon Apple Tarts",
                category: "Dessert",
                area: "French",
                instructions: "Preheat oven to 350°F. Prepare crust and filling...",
                thumbnail: "https://www.themealdb.com/images/media/meals/qtqwwu1511792650.jpg",
                tags: "apple, tart",
                youtubeURL: "https://www.youtube.com/watch?v=example1",
                ingredients: ["Apple", "Flour", "Sugar"],
                measures: ["2 cups", "1 cup", "1/2 cup"]
            )
        case "52856":
            return RecipeDetail(
                idMeal: "52856",
                name: "Choc Chip Pecan Pie",
                category: "Dessert",
                area: "American",
                instructions: "Mix ingredients and bake at 375°F...",
                thumbnail: "https://www.themealdb.com/images/media/meals/rqvwxt1511384809.jpg",
                tags: "chocolate, pie",
                youtubeURL: "https://www.youtube.com/watch?v=example2",
                ingredients: ["Chocolate Chips", "Pecan", "Pie Crust"],
                measures: ["1 cup", "1 cup", "1 crust"]
            )
        case "52853":
            return RecipeDetail(
                idMeal: "52853",
                name: "Chocolate Avocado Mousse",
                category: "Dessert",
                area: "Mexican",
                instructions: "Blend avocado and cocoa powder...",
                thumbnail: "https://www.themealdb.com/images/media/meals/uttuxy1511382180.jpg",
                tags: "chocolate, mousse",
                youtubeURL: "https://www.youtube.com/watch?v=example3",
                ingredients: ["Avocado", "Cocoa Powder", "Honey"],
                measures: ["2", "1/2 cup", "2 tbsp"]
            )
        default:
            throw NSError(domain: "MockRecipeFetcher", code: 404, userInfo: [NSLocalizedDescriptionKey: "Recipe not found"])
        }
    }
}

