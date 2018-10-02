//
//  ViewController.swift
//  RESTFacility
//
//  Created by Santosh Kumar Chaurasia on 2018-10-01.
//  Copyright © 2018 Santosh Kumar Chaurasia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var facilityClient : FacilityClient?

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.facilityClient =  FacilityClient()
            self.startfacilities()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func startfacilities()
    {
        FacilityVM(client:self.facilityClient)
    }

}

