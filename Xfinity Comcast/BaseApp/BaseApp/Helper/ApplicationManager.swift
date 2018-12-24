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
    
    public static func initialViewController(for appType: Constant.AppType) -> UIViewController? {
        let storyboard = UIStoryboard.init(name: Constant.StoryboardName.character, bundle: BaseAppBundleHelper.bundle)
        Constant.currentAppType = appType
        if let controller = storyboard.instantiateViewController(withIdentifier: Constant.StoryboardID.baseSplitViewController) as? UISplitViewController {
            return controller
        }
        return nil
    }
    
}
