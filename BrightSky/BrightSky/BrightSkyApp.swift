//
//  BrightSkyApp.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import SwiftUI

@main
struct BrightSkyApp: App {
    var body: some Scene {
        WindowGroup {
            // Inject store to give WeatherListScreen children access to weather data within
            WeatherListScreen().environmentObject(Store())
        }
    }
}
