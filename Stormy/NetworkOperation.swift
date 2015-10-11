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

    init(url: NSURL) {
        self.searchURL = url
    }
}