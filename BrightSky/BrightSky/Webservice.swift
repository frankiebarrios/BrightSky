//
//  Webservice.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation
// Endpoint Services
// Add catch for any errors received
enum NetworkError: Error {
    case badURL
    case noData
}

class Webservice {
    // Bonus: Possibly add zipcode param to be able to search city by zip as well as city name
    func getWeatherByCity(city: String, completion: @escaping ((Result<Weather, NetworkError>) -> Void)) {
        // Create URL for call
        // guard - check conditions are correct before exiting func
        guard let weatherURL = Constants.Urls.weatherByCity(city: city) else {
            return completion(.failure(.badURL))
        }
        
        // See URLSession resource used here : https://www.youtube.com/watch?v=ASR2aYzavoQ
        URLSession.shared.dataTask(with: weatherURL) { (data, _, error) in
            
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                // Upon success store weather
                completion(.success(weatherResponse.weather))
            }
            
        }.resume()
    }
    
}
