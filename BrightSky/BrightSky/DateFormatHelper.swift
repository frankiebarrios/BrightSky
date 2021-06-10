//
//  DateFormatHelper.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation

extension Date {
    
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
}
