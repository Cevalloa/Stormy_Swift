//
//  ViewController.swift
//  Stormy
//
//  Created by Alex Cevallos on 10/7/15.
//  Copyright (c) 2015 Alex Cevallos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Extract data from the pList into the dictionary
        if let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
            let weatherDictionary = NSDictionary(contentsOfFile: plistPath),
            let currentWeatherDictionary = weatherDictionary["currently"] as? [String : AnyObject]{
            
                let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                
                currentTemperatureLabel?.text = "\(currentWeather.temperature)º"
                currentHumidityLabel?.text = "\(currentWeather.humidity)%"
                currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
        }
    }
}

