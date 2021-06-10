//
//  Weather.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation

struct WeatherResponse: Decodable {
    // Build model containing only data for views from json payload
    let name: String
    var weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey {
        case name
        // Bring in everything from 'main' in JSON payload returned by API
        case weather = "main"
        // Bring in everything from 'weather' in JSON payload returned by API
        case icon = "weather"
        // Bring in everything from 'sys' in JSON payload returned by API
        case sys = "sys"
    }
    
    // Remap payload prop to prop name used for views
    enum WeatherKeys: String, CodingKey {
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        // Parent containing nested containers being used from json payload
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Nested containers
        // Parse props from containers needed
        name = try container.decode(String.self, forKey: .name)
        icon = try container.decode([WeatherIcon].self, forKey: .icon)
        sys = try container.decode(Sys.self, forKey: .sys)
        
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        
        // Weather constructor
        weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
    }
}

// Sunrise/ Sunset and parsing/ formatting needed
struct Sys: Decodable {
    
    let sunrise: Date
    let sunset: Date
    
    // Map to payload props
    private enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Parse into Int to use for time conversion due to JSON format
        let sunriseTimeInterval = try container.decode(Int32.self, forKey: .sunrise)
        let sunsetTimeInterval = try container.decode(Int32.self, forKey: .sunset)
        // Format times using converted JSON from above
        sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseTimeInterval))
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeInterval))
    }
    
}

// Don't need ID from payload
struct WeatherIcon: Decodable {
    let main: String
    let description: String
    let icon: String
}

// Final weather struct
struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunrise: Date
    let sunset: Date
}
