//
//  SearchService.swift
//  Reciplease
//
//  Created by Paul Oggero on 04/08/2022.
//

import Alamofire
import Foundation

protocol SearchServicing {
    var search: String { get set }
    func getSearch(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void)
}

class SearchService: NetworkManager, SearchServicing {
    var search: String = ""
    
    func getSearch(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        let url = "https://api.edamam.com/api/recipes/v2?type=public&app_id=fea4df48&app_key=d188677a672a589fa4898f6a4e470fa6"
        
        get(url: url, parameters: ["q": search]) { response in
            completion(response.result)
        }
    }
}

class SearchMockService: SearchServicing {
    var search: String = ""
    
    var getCallCounter = 0
    
    func getSearch(_ completion: @escaping (Result<SearchResponse, AFError>) -> Void) {
        getCallCounter += 1
        
        let response = SearchResponse(recipes: [
            Recipe(totalTime: 15, calories: 2871.0704237333985, label: "Chorizo, Avocado, and Egg Cemitas with Chipotle Mayonnaise Recipe", ingredientLines: [
            "1/4 cup mayonnaise",
            "1 teaspoon fresh lime juice from 1 lime",
            "1 chipotle pepper in adobo sauce, chopped, plus 1 tablespoon adobo sauce",
            "12 ounces Mexican chorizo sausage",
            "2 eggs",
            "2 large cemita rolls, bolillo rolls, or Kaiser rolls",
            "2 ounces Oaxacan cheese, or mozzarella, torn into pieces",
            "1/2 cup shredded iceberg lettuce",
            "1 small tomato, sliced",
            "1 avocado, sliced"
          ], image: "https://edamam-product-images.s3.amazonaws.com/web-img/bcd/bcd52f5195d4ee6af1c707882201067a.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLWVhc3QtMSJGMEQCIGCbs6cA1ov9ymPtXEYcNtzYKdrPVxgfzOw19jX1Gp70AiAUHGlcaQYzZM6cdP7W1tXyh%2BQmTuWFsRO2uveF8StZjCrbBAij%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIM%2FgNwmqvHloh98Ni8Kq8EJokrih79gGE8iSFC07MotwrierFi4f5kb822EZxXSyw83tfa%2F8kvpumIgMGfDxJRuxgnbqdGkfhqUrOQvTfVJAcoHwJdYzRyjgQQwJvL0kGZ1VsBoYlGHiqTq2vm1PXm22Cxml5A6uqaRUzKoiAYeu6FIfCfDnXiWznc%2B7Tw08NHp9asb0k3F%2Fua%2FAMm4u0jFB1d6f29CH%2Bb2oAahngzVWNxWL9oIFXXJVnN%2FbubTqcFAeFvOw3CgTWYDkGgIb%2BE4DaV%2F3D11EtCwqtje%2BqcKwpo9WIGj8QzQcEoc60HDr3e44oc3Kfu5rgogKVbZWJFgUsAi03KrxzCK3mizVni%2B1MuxmekNcSrrI1R7t2vTaCBRY%2FgrFZVi5kbu5lJaIZilIj%2F8DKbk4b1b8HPGecpv48m88kCK3UGTu%2Fd0vL6AsdzLoTYzY2jiaqf7sMYCRoyoeFqUB2zfbPwgveUlviT5jlmgazsGzblItFPcz3FR9B41pTsdLuGqmo5GTkENhWnDjdwddqcioEiTRbwEps1fhDGu93Yz2eI%2BhGLR5d69lvFr%2FXLEi7o1yjhXlDeA%2FpP9ESxKGwxrRsE9tBm4o78L2Yqmn2AJVR5RHG1GCKMo6HjImQAjNrn09kQHzLGbw4LYzzhFFnXtjwiWSPiBR4Awf57V%2FIsms6VGXNq%2BDx0%2BVxqwY%2BSgBHnr0PMLkVkprXgtqoUPgQq3WAai%2FY5P6jOLy85FmmVq%2BiZ8qPfTP8dHjDZqq6XBjqqAUU2Yqq03Yscg5VLV8nB2491%2Bg9%2Fsi6q826ImY5MzLoDi1j1ltVyQgaidSQHoYnwgIfRKEOf264z5m9YC2XK1oK6HZpXdKyfzZSvozPahIzrmzqNTTjhqTaIH13MPrQ7FWuT2tBy2jwVzU6uYMFmAxWBccc08bjgyCf4fxorJ6FkRjS1KZP0atNqPqPt71dpiXW2pSnRxx2M50z7ljdiPNJopnSd2oFwFsi%2F&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220804T104109Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFMS5VPZSI%2F20220804%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=fa17aa4dd5e42b87c8d3d13d6c27d2fbb9cac6ae7fcb8fd78c39928610be6cf2", url: "http://www.seriouseats.com/recipes/2013/03/chorizo-avocado-egg-cemitas-chipotle-mayonnaise-recipe.html")
        ,
            Recipe(totalTime: 20, calories: 584.46, label: "Poached eggs with smashed avocado & tomatoes", ingredientLines: [
            "2 tomatoes, halved",
            "Â½ tsp rapeseed oil",
            "2 eggs",
            "1 small ripe avocado",
            "2 slices seeded wholemeal soda bread (see goes well with)",
            "2 handfuls rocket"
          ], image: "https://edamam-product-images.s3.amazonaws.com/web-img/8da/8da826f4b11e0a05d27cdd82419dfd39.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEEoaCXVzLWVhc3QtMSJGMEQCIGCbs6cA1ov9ymPtXEYcNtzYKdrPVxgfzOw19jX1Gp70AiAUHGlcaQYzZM6cdP7W1tXyh%2BQmTuWFsRO2uveF8StZjCrbBAij%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDE4NzAxNzE1MDk4NiIM%2FgNwmqvHloh98Ni8Kq8EJokrih79gGE8iSFC07MotwrierFi4f5kb822EZxXSyw83tfa%2F8kvpumIgMGfDxJRuxgnbqdGkfhqUrOQvTfVJAcoHwJdYzRyjgQQwJvL0kGZ1VsBoYlGHiqTq2vm1PXm22Cxml5A6uqaRUzKoiAYeu6FIfCfDnXiWznc%2B7Tw08NHp9asb0k3F%2Fua%2FAMm4u0jFB1d6f29CH%2Bb2oAahngzVWNxWL9oIFXXJVnN%2FbubTqcFAeFvOw3CgTWYDkGgIb%2BE4DaV%2F3D11EtCwqtje%2BqcKwpo9WIGj8QzQcEoc60HDr3e44oc3Kfu5rgogKVbZWJFgUsAi03KrxzCK3mizVni%2B1MuxmekNcSrrI1R7t2vTaCBRY%2FgrFZVi5kbu5lJaIZilIj%2F8DKbk4b1b8HPGecpv48m88kCK3UGTu%2Fd0vL6AsdzLoTYzY2jiaqf7sMYCRoyoeFqUB2zfbPwgveUlviT5jlmgazsGzblItFPcz3FR9B41pTsdLuGqmo5GTkENhWnDjdwddqcioEiTRbwEps1fhDGu93Yz2eI%2BhGLR5d69lvFr%2FXLEi7o1yjhXlDeA%2FpP9ESxKGwxrRsE9tBm4o78L2Yqmn2AJVR5RHG1GCKMo6HjImQAjNrn09kQHzLGbw4LYzzhFFnXtjwiWSPiBR4Awf57V%2FIsms6VGXNq%2BDx0%2BVxqwY%2BSgBHnr0PMLkVkprXgtqoUPgQq3WAai%2FY5P6jOLy85FmmVq%2BiZ8qPfTP8dHjDZqq6XBjqqAUU2Yqq03Yscg5VLV8nB2491%2Bg9%2Fsi6q826ImY5MzLoDi1j1ltVyQgaidSQHoYnwgIfRKEOf264z5m9YC2XK1oK6HZpXdKyfzZSvozPahIzrmzqNTTjhqTaIH13MPrQ7FWuT2tBy2jwVzU6uYMFmAxWBccc08bjgyCf4fxorJ6FkRjS1KZP0atNqPqPt71dpiXW2pSnRxx2M50z7ljdiPNJopnSd2oFwFsi%2F&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220804T104109Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFMS5VPZSI%2F20220804%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=2c5c436e1a950cd9a25fde8831a437e436712a4729db99424f4f857adfa5aae0", url: "https://www.bbcgoodfood.com/recipes/poached-eggs-smashed-avocado-tomatoes"),
        ])
        
        completion(.success(response))
    }
}

