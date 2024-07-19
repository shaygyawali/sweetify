//
//  RecipeDetailViewModel.swift
//  sweetify
//
//  Created by Shay Gyawali on 7/19/24.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    @Published var detail : RecipeDetail?
    
    func fetchRecipeDetails() {
        print("📍 \(detail?.name)")
        
    }
    
    func findRecipe(id: String){
        let recipe1 = RecipeDetail(
            idMeal: "52768",
            name: "Apple Frangipan Tart",
            category: "Dessert",
            area: "British",
            instructions: """
            Preheat the oven to 200C/180C Fan/Gas 6.
            Put the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs.
            """,
            thumbnail: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
            tags: "Tart,Baking,Fruity",
            youtubeURL: "https://www.youtube.com/watch?v=rp8Slv4INLk",
            ingredients: [
                "digestive biscuits",
                "butter",
                "Bramley apples",
                "butter, softened",
                "caster sugar",
                "free-range eggs, beaten",
                "ground almonds",
                "almond extract",
                "flaked almonds"
            ],
            measures: [
                "175g/6oz",
                "75g/3oz",
                "200g/7oz",
                "75g/3oz",
                "75g/3oz",
                "2",
                "75g/3oz",
                "1 tsp",
                "50g/1¾oz"
            ]
        )
        
        let recipe2 = RecipeDetail(
            idMeal: "52893",
            name: "Apple & Blackberry Crumble",
            category: "Dessert",
            area: "British",
            instructions: """
            Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl.
            """,
            thumbnail: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
            tags: "Pudding",
            youtubeURL: "https://www.youtube.com/watch?v=4vhcOwVBDO4",
            ingredients: [
                "Plain Flour",
                "Caster Sugar",
                "Butter",
                "Braeburn Apples",
                "Butter",
                "Demerara Sugar",
                "Blackberrys",
                "Cinnamon",
                "Ice Cream"
            ],
            measures: [
                "120g",
                "60g",
                "60g",
                "300g",
                "30g",
                "30g",
                "120g",
                "¼ teaspoon",
                "to serve"
            ]
        )


        let recipe3 = RecipeDetail(
            idMeal: "52768",
            name: "Apple Frangipan Tart",
            category: "Dessert",
            area: "British",
            instructions: """
            Preheat the oven to 200C/180C Fan/Gas 6.
            Put the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs.
            Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter.
            Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer.
            """,
            thumbnail: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
            tags: "Tart,Baking,Fruity",
            youtubeURL: "https://www.youtube.com/watch?v=rp8Slv4INLk",
            ingredients: [
                "digestive biscuits",
                "butter",
                "Bramley apples",
                "butter, softened",
                "caster sugar",
                "free-range eggs, beaten",
                "ground almonds",
                "almond extract",
                "flaked almonds"
            ],
            measures: [
                "175g/6oz",
                "75g/3oz",
                "200g/7oz",
                "75g/3oz",
                "75g/3oz",
                "2",
                "75g/3oz",
                "1 tsp",
                "50g/1¾oz"
            ]
        )
        
        let recipe4 = RecipeDetail(
            idMeal: "52767",
            name: "Bakewell Tart",
            category: "Dessert",
            area: "British",
            instructions: """
            To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.
            """,
            thumbnail: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
            tags: "Tart,Baking,Alcoholic",
            youtubeURL: "https://www.youtube.com/watch?v=1ahpSTf_Pvk",
            ingredients: [
                "plain flour",
                "chilled butter",
                "cold water",
                "raspberry jam",
                "butter",
                "caster sugar",
                "ground almonds",
                "free-range egg, beaten",
                "almond extract",
                "flaked almonds"
            ],
            measures: [
                "175g/6oz",
                "75g/2½oz",
                "2-3 tbsp",
                "1 tbsp",
                "125g/4½oz",
                "125g/4½oz",
                "125g/4½oz",
                "1",
                "½ tsp",
                "50g/1¾oz"
            ]
        )
        
        let allRecipes = [recipe1, recipe2, recipe3, recipe4]

        for info in allRecipes {
            if info.idMeal == id{
                detail = info
            }
        }
        
        
        
    }
    
}
