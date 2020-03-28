//
//  WeatherDetail.swift
//  WeatherGfit
//
//  Created by Kelvin Cheng on 3/22/20.
//  Copyright © 2020 Kelvin Cheng. All rights reserved.
//

import Foundation

class WeatherDetail: WeatherLocation {
    
    struct Result: Codable {
        var timezone: String
        var currently: Currently
        var daily: Daily
    }
    
    struct Currently: Codable {
        var temperature: Double
        var time: TimeInterval
    }
    
    struct Daily: Codable {
        var summary: String
        var icon: String
    }
    
    var timezone = ""
    var currentTime = 0.0
    var temperature = 0
    var summary = ""
    var dailyIcon = ""
    
    func getData(completed: @escaping () -> () ) {
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurl.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"
        
        // create url
        guard let url = URL(string: urlString) else {
            print("Error: could not create a url from \(urlString)")
            completed()
            return
        }
        
        // create session
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            // deal with the data
            do {
                
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timezone = result.timezone
                self.currentTime = result.currently.time
                self.temperature = Int(result.currently.temperature.rounded())
                self.summary = result.daily.summary
                self.dailyIcon = result.daily.icon
            }
            catch {
                print("JSON Error: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
}
