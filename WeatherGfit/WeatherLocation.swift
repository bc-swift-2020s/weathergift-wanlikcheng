//
//  WeatherLocation.swift
//  WeatherGfit
//
//  Created by Kelvin Cheng on 3/3/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
