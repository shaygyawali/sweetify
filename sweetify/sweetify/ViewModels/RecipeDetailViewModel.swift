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
        print("📍 \(detail?.ingredients)")
    }
    
    func listifyInstructions(instructions: String) -> [String] {
        let instructionsList = instructions.components(separatedBy: "\n")
        return instructionsList
    }
    
    func findRecipe(id: String){
        let recipe1 = RecipeDetail(
            idMeal: "52768",
            name: "Apple Frangipan Tart",
            category: "Dessert",
            area: "British",
            instructions: """
            Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.
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
            Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.
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
            Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.
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
            To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.
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

        print("LOOKING FOR RECIPES")
        
        for info in allRecipes {
            print("Inside 1 \(info.idMeal) and \(id)")
            if info.idMeal == id{
                print("recipe found")
                detail = info
            }
        }
        
        
        
    }
    
}
