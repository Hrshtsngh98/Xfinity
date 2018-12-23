//
//  CharacterListViewModel.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/23/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    var characterFactory: CharacterFactory
    var titleString: String
    
    
    init() {
        let appType = Constant.currentAppType
        titleString = appType.rawValue
        switch appType {
        case .SimpsonsCharacterViewer:
            characterFactory = SimpsonFactory()
        case .TheWireCharacterViewer:
            characterFactory = WireCharacterFactory()

        }
    }
}
