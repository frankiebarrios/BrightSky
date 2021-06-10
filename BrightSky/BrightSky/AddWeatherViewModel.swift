//
//  AddWeatherViewModel.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation
// Calls webservice to build our WeatherViewModel

// Class vs struct, think I want class here to avoid overwriting any data held in memory
class AddWeatherViewModel: ObservableObject {
    
    var city: String = ""
    
    // Make sure we're communicating with the web service!
    // Look at DispatchQueues
    func save(completion: @escaping (WeatherViewModel) -> Void) {
        // Get city
        Webservice().getWeatherByCity(city: city) { (result) in
            switch result {
            // If successful add city to weather model
                case .success(let weather):
                    DispatchQueue.main.async {
                        completion(WeatherViewModel(weather: weather))
                    }
            // If failed log out error
                case .failure(let error):
                    print(error)
            }
        }
        
    }
    
}
