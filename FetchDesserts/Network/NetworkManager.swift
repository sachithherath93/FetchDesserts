//
//  NetworkManager.swift
//  FetchDesserts
//
//  Created by Sachith H on 5/12/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum MealError: Error {
    case urlError
    case requestError
    case responseError
    case dataError
}

typealias mealCompletion = ([MealItem]?, MealError?) -> Void

struct NetworkManager {
    func executeMealListRequest(category: String, completion: @escaping mealCompletion) {
        guard let request = createRequest(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") else {
            completion(nil, .urlError)
            return
        }
        executeRequest(request: request, onCompletion: completion)
    }
    
    func executeMealRecipeRequest(mealId: String, completion: @escaping mealCompletion) {
        guard let request = createRequest(urlString: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            completion(nil, .urlError)
            return
        }
        executeRequest(request: request, onCompletion: completion)
    }
    
    private func executeRequest(request: URLRequest, onCompletion: @escaping mealCompletion) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                onCompletion(nil, .requestError)
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse, urlResponse.statusCode == 200 else {
                onCompletion(nil, .responseError)
                return
            }
            
            guard let data = data else {
                onCompletion(nil, .dataError)
                return
            }
            
            do {
                let responseMeals = try JSONDecoder().decode(Meals.self, from: data)
                let mealItems = responseMeals.meals
                // Bring back to the main thread since the datatask call backs run in the background
                DispatchQueue.main.async {
                    onCompletion(mealItems, nil)
                }
            } catch {
                onCompletion(nil, .dataError)
                return
            }
        }
        
        dataTask.resume()
    }
    
    // In case other types of requests come along later. put/ delete etc. Also if we need to adjust the request headers in future
    private func createRequest(urlString: String, method: HTTPMethod = .get) -> URLRequest? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
