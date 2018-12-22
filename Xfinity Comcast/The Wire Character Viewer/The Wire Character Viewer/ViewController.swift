//
//  ViewController.swift
//  The Wire Character Viewer
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit
import BaseApp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpData()
        
    }
    
    func setUpData() {
        
        var simpsonData = SimpsonFactory.init()
        
        simpsonData.getData { (model, error) in
            if error == nil {
                print(model)
                
            } else {
                showErrorAlert(controller: self, error: error, alertActions: nil)
            }
        }
    }


}


