//
//  NavViewHelper.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
