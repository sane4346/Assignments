//
//  FacilityVM.swift
//  CarsTask
//
//  Created by Santosh chaurasia on 30/09/18.
//  Copyright (c) 2018 Santosh chaurasia. All rights reserved.
//

import Foundation

class FacilityVM {
    var client : FacilityClient?
    
    init(client: FacilityClient?) {
        self.client = client
        callAPI()
    }
    
    deinit {
        
    }
    func callAPI()
    {
        guard let request = client?.getBaseRequest( requestMethod: .get) else {
            return
        }
        client?.sendRequestForData(request: request, completion: { data , error in
            print("data = \(String(describing: data))")
        })
    }
    
}
