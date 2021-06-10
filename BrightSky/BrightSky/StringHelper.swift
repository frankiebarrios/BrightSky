//
//  StringHelper.swift
//  BrightSky
//
//  Created by Frankie Barrios on 6/9/21.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
