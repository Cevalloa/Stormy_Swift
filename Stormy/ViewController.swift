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
    
    private let forecastAPIKey = "bdf30eab98fdf609e887c18b37a7b694"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = NSURL(string: "https://api.forecast.io/\(forecastAPIKey)/")
        
        let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)

        // Use NSURLSession API to fetch data
        let defaultConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: defaultConfiguration)
        
        // NSURLRequest object
        let request = NSURLRequest(URL: forecastURL!)
        
        let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            println(data)
        })
        
        dataTask.resume()
    }
}

