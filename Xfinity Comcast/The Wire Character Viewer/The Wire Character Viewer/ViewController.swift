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
        
        let wireCharacterFactory = WireCharacterFactory()
        wireCharacterFactory.getData { (model, error) in
            if let error = error {
                self.showErrorAlert(error: error, alertActions: nil)
            }
        }
        
    }


}


