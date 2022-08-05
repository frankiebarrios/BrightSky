//
//  Endpoints.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation

struct Constants {
    struct Urls {
        // OpenWeatherMap weatherByCity endpoint
        static func weatherByCity(city: String) -> URL? {
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=APIKeyGoesHere")
        }
        
        // Include weatherByZip endpoint if support added
        
        // Icon endpoint
        static func weatherUrlAsStringByIcon(icon: String) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
