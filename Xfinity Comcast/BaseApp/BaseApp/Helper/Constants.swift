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
    
    public static var currentAppType: AppType = .SimpsonsCharacterViewer
    
    public enum AppType: String {
        case TheWireCharacterViewer = "The Wire Character Viewer"
        case SimpsonsCharacterViewer = "Simpsons Character Viewer"
    }
    
    public enum ServiceUrls {
        static let simpsonsCharacterViewer = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
        static let theWireCharacterViewer = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
    }
    
    public enum DefaultStrings {
        static let defaultImageName = "default_image"
        static let characterDetailString = "Character Detail"
        static let characterDetailTitleString = "Character Name"
        static let searchPlaceHolder = "Search Character"
    }
    
}
