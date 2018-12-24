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
    
    @IBOutlet weak var appName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        appName.text = Constant.AppType.TheWireCharacterViewer.rawValue
    }
    
    @IBAction func startAppAction(_ sender: Any) {
        if let viewController = ApplicationManager.initialViewController(appType: .TheWireCharacterViewer) {
            present(viewController, animated: true, completion: nil)
        }
    }
}


