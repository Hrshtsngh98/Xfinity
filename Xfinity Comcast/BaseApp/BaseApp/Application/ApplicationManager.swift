//
//  ApplicationManager.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation
import UIKit

public class ApplicationManager {
    
    public static func initialViewController() -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Character", bundle: BaseAppBundleHelper.bundle)
        if let controller = storyboard.instantiateInitialViewController() {
            return controller
        }
        return nil
    }
    
}
