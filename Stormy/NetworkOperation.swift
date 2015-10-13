//
//  NetworkOperation.swift
//  Weathery
//
//  Created by Alex Cevallos on 10/11/15.
//  Copyright (c) 2015 Alex Cevallos. All rights reserved.
//

import Foundation

class NetworkOperation {
    
    // Properties aren't initialized until actually aclled in a method
    lazy var defaultConfiguration: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.defaultConfiguration)
    let searchURL: NSURL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void

    init(url: NSURL) {
        self.searchURL = url
    }
    
    func downloadJSONFromUrl(completion: JSONDictionaryCompletion) {
        
        let request: NSURLRequest = NSURLRequest(URL: searchURL)
        let dataTask = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            // Check HTTP response for success GET
            if let httpResponse = response as? NSHTTPURLResponse {
                
                switch(httpResponse.statusCode) {
                    
                case 200:
                    // Create JSON Object with data
                    let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
                    completion(jsonDictionary)
                default:
                    println("GET request has failed with \(httpResponse.statusCode)")
                }
                
            } else {
                println("No http response")
            }
        }
    }
}