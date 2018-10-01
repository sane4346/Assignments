//
//  FacilityClient.swift
//  CarsTask
//
//  Created by Santosh chaurasia on 30/09/18.
//  Copyright (c) 2018 Santosh chaurasia. All rights reserved.
//

import Foundation
import UIKit

enum httpRequestMethod : String {
    case get = "GET"
    case post = "POST"
}


let APIPath = "https://my-json-server.typicode.com/iranjith4/ad-assignment/db"

let IconsPath = "http://bit.ly/2KKsHOG"

class FacilityClient {
    
    var baseUrl : String?
    var iconUrl : String?
    
    init()
    {
        self.baseUrl = APIPath
        self.iconUrl = IconsPath
    }
    
    func getBaseRequest(path: String? = nil ,requestMethod : httpRequestMethod? = .get , param : [String : Any] = [:]) -> URLRequest
    {
        guard let url = baseUrl  else {
            return
        }
        
        
        
    }
}

