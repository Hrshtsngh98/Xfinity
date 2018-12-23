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
    
    public static func initialViewController(appType: Constant.AppType) -> UIViewController? {
        let storyboard = UIStoryboard.init(name: "Character", bundle: BaseAppBundleHelper.bundle)
        if let controller = storyboard.instantiateViewController(withIdentifier: "CharacterNavigationController") as? UINavigationController {
            return controller
        }
        return nil
    }
    
}
