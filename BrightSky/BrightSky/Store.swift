//
//  Store.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation

// Class vs struct, think I want class here to avoid overwriting any data held in memory
class Store: ObservableObject {
    // If temp conversions is added back into app, just recycle this
//    @Published var selectedUnit: TemperatureUnit = .kelvin
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(_ weather: WeatherViewModel) {
        weatherList.append(weather)
    }
    
}
