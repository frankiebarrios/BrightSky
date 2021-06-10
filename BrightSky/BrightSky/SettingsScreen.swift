//
//  SettingsScreen.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import SwiftUI

struct SettingsScreen: View {
    
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Dark Mode Button")
                .padding()
                .navigationTitle("Settings")
                .navigationBarItems(trailing: Button("Done") {
                    mode.wrappedValue.dismiss()
                })
                    .embedInNavigationView()
        }
    }

    struct SettingsScreen_Previews: PreviewProvider {
        static var previews: some View {
            SettingsScreen()
        }
    }
}
