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

    @IBOutlet weak var openWireCharacterApp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpData()
        openWireCharacterApp.addTarget(self, action: #selector(openApp), for: .touchUpInside)
        
    }
    
    func setUpData() {
        
        let wireCharacterFactory = WireCharacterFactory()
        wireCharacterFactory.getData { (model, error) in
            if let error = error {
                self.showErrorAlert(error: error, alertActions: nil)
            }
        }
    }
    
    @objc func openApp() {
        if let viewController = ApplicationManager.initialViewController() {
            present(viewController, animated: true, completion: nil)
        }
    }


}


