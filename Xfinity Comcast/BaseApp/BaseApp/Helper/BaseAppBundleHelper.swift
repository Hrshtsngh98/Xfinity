//
//  BaseAppBundleHelper.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

final class BaseAppBundleHelper {
    
    // Property to return the current app bundle.
    static var bundle: Bundle {
        return Bundle(for: self)
    }
}
