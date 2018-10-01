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
        
        var requestURL: URL = url

            if let newURL = URL(string: url.absoluteString + "?" + paramString) {
                requestURL = newURL
        }
        
        var request: URLRequest? = URLRequest(url: requestURL)
        request?.timeoutInterval = 10
        request?.allHTTPHeaderFields
        request?.httpMethod = requestMethod.rawValue
        
 
    
    }
    
    
    getreques(needToSaveInterval: String? = nil, request: URLRequest, completion: ((JsonDictionary?, Error?) -> Void)?) {
    requestQueue.addOperation { [weak self] in
    let task = self?.session.dataTask(with: request) { [weak self] data, response, error in
    
        guard
        error == nil,
        let httpResponse = response as? HTTPURLResponse,
        httpResponse.statusCode == 200,
        let data = data,
        let jsonData = try? JSONSerialization.jsonObject(with: data, options: []),
        let json = jsonData as? JsonDictionary,
        let rsp = json["rsp"] as? JsonDictionary
        else {
        if (response as? HTTPURLResponse)?.statusCode == 401 {
        self?.token = nil
        self?.requestQueue.isSuspended = true

            }
        completion?(nil, error)
        return
        }
 
        completion?(rsp, nil)
        }
        task?.resume()
    }
    }
}

