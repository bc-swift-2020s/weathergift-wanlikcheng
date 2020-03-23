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
    
    func getData() {
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurl.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"
        
        // create url
        guard let url = URL(string: urlString) else {
            print("Error: could not create a url from \(urlString)")
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
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
            }
            catch {
                print("JSON Error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
