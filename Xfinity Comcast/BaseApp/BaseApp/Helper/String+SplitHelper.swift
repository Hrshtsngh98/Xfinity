//
//  String+SplitHelper.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/23/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

extension String {
    
    //generic method to split string.
    public func splitByHyphen() -> [String] {
        return self.components(separatedBy: Constant.Separator.hyphenSpace)
    }
    
}
