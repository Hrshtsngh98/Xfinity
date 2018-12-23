//
//  Constants.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

public typealias completionHandler = (Data?, Error?) -> ()
public typealias completionForCharacterModel = (CharacterModel?, Error?) -> ()

public class Constant {
    
    public enum AppType {
        case TheWireCharacterViewer
        case SimpsonsCharacterViewer
    }
    
    public enum ServiceUrls {
        static let simpsonsCharacterViewer = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
        static let theWireCharacterViewer = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    }
    
    public enum Strings {
        static let defaultImageName = "default_image"
    }
    
}
