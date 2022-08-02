//
//  Recipe.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let time: Double
    let likes: Double
    let ingredients: String
    let imageURL: String
    
    static var mock = Recipe(name: "Pizza", time: 3, likes: 2500, ingredients: "Mozzarella, Basil, Large tomato", imageURL: "https://edamam-product-images.s3.amazonaws.com/web-img/bcd/bcd52f5195d4ee6af1c707882201067a.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjECQaCXVzLWVhc3QtMSJGMEQCIFbTiod3IMnm8pcBSZRTPjMbkkojTceBYFoZOFmxygzUAiAFGg7YUL1EEZOS3xGWh4iuB6fcBPO7MI1Yw9P1doRm%2BCrSBAh9EAAaDDE4NzAxNzE1MDk4NiIMa5lIcGnHbGo76AdOKq8EzVygVICMoFlvxaFZYeOx0uSJ81ziR%2F7WUcxgBICe%2BL%2FDz%2B0%2FQ5EP0l25RcmbpD0CVXzACaKqTiyr6cl%2BE9OyCNeLiiZaKKS07%2Bs4HVYkAsJcn04krf8szfpLJn6%2Bx0fsCIk0YLcYiei9jQXOySPLy8ZAvwhX6k1T4cYEd91YXJYxBi3Yw0sSrSbIdhmdZzZc195fwho5i%2B4xXChUmMQewCj2vsIjIPUPu%2BmIZ5hJZrONQbDQqSmyS03ciRUV4RpRINcXzDu8wzB79XKDOCgZWa3p32QL5tbWIOAahk%2F%2BGmM5OX%2Fo517CxmPD64LAKD8FZukGWIMrJrEILXUEmu%2Buwih%2BnuSZ29guNtSDyt9QIyCjT37Pfyn1HnH7rMzgE4qqyVkgd6ZN2k46G%2B%2F433n6BS6dj3jp6x106rBY2BToI0ISlMlkiYp1E5W8BAFUR3eStpy4zS75pp96MAY1E5e%2FVNiLUFHWNUZqdUYDLsNrNFNq%2Fn3%2FCFdQDpjEL%2FELWDXUGmC%2FnGIO3HlYZaI7dlQVk2fdaOCi8TY5erZNLw8zt4YXKDaBIRC8OW%2BvsPYG6%2BZa42FyP1bx5NpPmQRwVcZmrWaiKWAmjFmuZDgiUu13a2hb7bMcSqVi3lewrTTJt32eeROY1Mv%2FF3ZfvkW2o%2BqWJjomkpEgXOXIaRO%2BJWI7UMT%2Fkzp48vLZkaBg1PLrT0%2F%2BWAoa8dDD1jHyGAP5ch%2BAdOnOCN7Ag0OkIFrn9ti4YDCG%2FaWXBjqqAeG9KtuKRFhNCk3lHZANCXvOE5finrZVUxxHeHJMsi3I8xZ0p8cSE1t2%2F4rqGQOCDKUGFVVOROdLQLejsn7zLvRWH1aW3D2ZcL%2BQ1EjzXUnzLK6R0KefWWMJ%2FI9MuGZPHf789wgg7ylhLWZjM1lWNUtW11sM7WjjfuYqmpRsVKXPmO2OKPnAn0bQU%2FejxzolqFETRDGh5QoDNXTLlK7mj%2FX1SZq8ZM5UXixt&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220802T202455Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDZNZTQEQ%2F20220802%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=3ccc820cdcbd86a46af0c78b68ed9377a608c5456af64ddfbd6f94af6d6241ec")
    
    
    init(name: String, time: Double, likes: Double, ingredients: String, imageURL: String) {
        self.name = name
        self.time = time
        self.likes = likes
        self.ingredients = ingredients
        self.imageURL = imageURL
    }
}
