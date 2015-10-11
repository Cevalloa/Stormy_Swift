//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Alex Cevallos on 10/10/15.
//  Copyright (c) 2015 Alex Cevallos. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    let temperature: Int
    let humidity: Int
    let precipProbability :Int
    let summary: String
    
    init(weatherDictionary : [String : AnyObject]) {
        
        temperature = weatherDictionary["temperature"] as! Int
       
        // Int will cut off numbers to the right of the decimal
        let humidityFloat = weatherDictionary["humidity"] as! Double
        humidity = Int(humidityFloat * 100)
        
        let precipFloat = weatherDictionary["precipProbability"] as! Int
        precipProbability = Int(precipFloat * 100)
        
        summary = weatherDictionary["summary"] as! String

    }
}