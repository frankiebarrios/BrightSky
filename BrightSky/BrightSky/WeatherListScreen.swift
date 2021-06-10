//
//  WeatherListScreen.swift
//  BrightSky
//  Recycle settings feature for map
//  Created by Frankie Barrios on 6/9/21.
//

import SwiftUI
// Look at using Sheets vs Tabs???

// Identifiable for binding
enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
//    case map
}

struct WeatherListScreen: View {

    // Give AddCityScreen and SettingScreen access to Store
    // Store populates upon load, pass into children to give them access to store data
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
    var body: some View {
        
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
            }
        .listStyle(PlainListStyle())
        
        // Show sheet containing SettingsScreen or AddWeatherScreen based on click evt
        .sheet(item: $activeSheet, content: { (item) in
            switch item {
            // If sheet is addCity display addCity screen and vice versa for settings screen
                case .addNewCity:
                    // Give AddCityScreen and SettingScreen access to Store
                    AddCityScreen().environmentObject(store)
                case .settings:
                    // Give AddCityScreen and SettingScreen access to Store
                    // May need if I add temp conversions or dark mode features
                    SettingsScreen().environmentObject(store)
            }
        })
        // Evt handlers for button clicks
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
        }) {
            Image(systemName: "gearshape")
        }, trailing: Button(action: {
            activeSheet = .addNewCity
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Locations")
        .embedInNavigationView()
       
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen().environmentObject(Store())
    }
}

struct WeatherCell: View {
    
    let weather: WeatherViewModel
    
    // View for map with pin
    struct CityMapView: View {
        let cityName: String

        var body: some View {
            Text("Map View Goes Here")
                .font(.largeTitle)
        }
    }
//    print(weather)

    var body: some View {
        // Would need to pass in whatever param mapkit requires for the lcoation placing
        // of a pin to NavLinks
        NavigationLink(destination: CityMapView(cityName: "Test City Data")) {
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(weather.city)
                        .fontWeight(.bold)
                    HStack {
                        Image(systemName: "sunrise")
                        Text("\(weather.sunrise.formatAsString())")
                    }
                    HStack {
                        Image(systemName: "sunset")
                        Text("\(weather.sunset.formatAsString())")
                    }
                }
                Spacer()
                // Get icon image, endpoint in helper
                URLImage(url: Constants.Urls.weatherUrlAsStringByIcon(icon: weather.icon))
                    .frame(width: 50, height: 50)
                
                // Clean this up into a helper, doing K -> F conversion inline here below
                // May add K & C comnversions later?
                Text("\(Int(1.8 * (weather.temperature - 273) + 32)) F")
                
                // Try to get ahold of location data I would need to pass to
                // an implementation of a map view where once a weathercell is
                // clicked, the map view shows with a pin showing that weather cells
                // location
            }
            .padding()
            .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        }
        

    }
}
