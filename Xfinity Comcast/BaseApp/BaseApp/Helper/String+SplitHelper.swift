//
//  String+SplitHelper.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/23/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

extension String {
    
    public func splitByHypen() -> [String] {
        return self.components(separatedBy: " - ")
    }
    
}
