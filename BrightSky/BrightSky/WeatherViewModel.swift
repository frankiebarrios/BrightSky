//
//  WeatherViewModel.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation

struct WeatherViewModel {
    //  Represent weather for screens/ views
    // Pass in weather model object
    // so weird how we can do this without an explicit import
    let weather: Weather
    
    let id = UUID()
    
    // Settings prob wont need unless temp conversion added back
//    func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
//        switch unit {
//            case .kelvin:
//                return weather.temperature
//            case .celsius:
//                return weather.temperature - 273.15
//            case .fahrenheit:
//                return 1.8 * (weather.temperature - 273) + 32
//        }
//    }
    
    var temperature: Double {
        return weather.temperature
    }
    
    var city: String {
        return weather.city
    }
    
    var icon: String {
        return weather.icon
    }
    
    var sunrise: Date {
        return weather.sunrise
    }
    
    var sunset: Date {
        return weather.sunset
    }
    
    
}
