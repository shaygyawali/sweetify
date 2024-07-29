import Foundation

struct DetailWrapper: Codable {
    let items: [RecipeDetail]
    
    enum CodingKeys: String, CodingKey {
        case items = "meals"
    }
}
struct RecipeDetail: Codable {
    let idMeal: String
    let name: String
    let category: String
    let area: String
    let instructions: String
    let thumbnail: String
    let tags: String?
    let youtubeURL: String?
    let ingredients: [String]
    let measures: [String]
    
    enum CodingKeys: String, CodingKey {
        case idMeal = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
        case youtubeURL = "strYoutube"
    }
    
    // Additional CodingKeys for ingredients and measurement decoding
    struct AdditionalKeys: CodingKey {
        var stringValue: String
        var intValue: Int?
        
        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = nil
        }
        
        init?(intValue: Int) {
            return nil
        }
    }
    
    // Custom decoder to help decode + parse ingredient and measurement values
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idMeal = try container.decode(String.self, forKey: .idMeal)
        name = try container.decode(String.self, forKey: .name)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtubeURL = try container.decodeIfPresent(String.self, forKey: .youtubeURL)
        
        var ingredientsHolder = [String]()
        var measurementsHolder = [String]()
        let additionalContainer = try decoder.container(keyedBy: AdditionalKeys.self)
        
        for i in 1...20 {
            let ingredientKey = AdditionalKeys(stringValue: "strIngredient\(i)")!
            let measurementKey = AdditionalKeys(stringValue: "strMeasure\(i)")!
            
            if let ingredient = try additionalContainer.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.isEmpty {
                ingredientsHolder.append(ingredient)
            }
            
            if let measurement = try additionalContainer.decodeIfPresent(String.self, forKey: measurementKey),
               !measurement.isEmpty {
                measurementsHolder.append(measurement)
            }
        }
        
        ingredients = ingredientsHolder
        measures = measurementsHolder
    }
    
    // Custom initializer
    init(idMeal: String, name: String, category: String, area: String, instructions: String, thumbnail: String, tags: String?, youtubeURL: String?, ingredients: [String], measures: [String]) {
        self.idMeal = idMeal
        self.name = name
        self.category = category
        self.area = area
        self.instructions = instructions
        self.thumbnail = thumbnail
        self.tags = tags
        self.youtubeURL = youtubeURL
        self.ingredients = ingredients
        self.measures = measures
    }
}
