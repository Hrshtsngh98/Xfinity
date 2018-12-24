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

public struct Constant {
    
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
        static let error = "Error"
        static let ok = "Ok"
    }
    
    public enum StoryboardName {
        static let character = "Character"
        static let characterDetail = "CharacterDetail"
    }
    
    public enum StoryboardID {
        static let baseSplitViewController = "UISplitViewController"
        static let characterDetailViewController = "CharacterDetailViewController"
    }
    
    public enum Separator {
        static let hypenSpace = " - "
    }
}
