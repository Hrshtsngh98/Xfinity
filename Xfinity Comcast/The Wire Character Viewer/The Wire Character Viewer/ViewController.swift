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
        openWireCharacterApp.addTarget(self, action: #selector(openApp), for: .touchUpInside)
        
    }
    
    @objc func openApp() {
        if let viewController = ApplicationManager.initialViewController(appType: .SimpsonsCharacterViewer) {
            present(viewController, animated: true, completion: nil)
        }
    }


}


