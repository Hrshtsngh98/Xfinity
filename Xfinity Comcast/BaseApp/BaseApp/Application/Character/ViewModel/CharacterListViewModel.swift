//
//  CharacterListViewModel.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/23/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    var charactoryFactory: CharacterFactory
    
    init(appType: Constant.AppType) {
        
        switch appType {
        case .SimpsonsCharacterViewer:
            charactoryFactory = SimpsonFactory()
        case .TheWireCharacterViewer:
            charactoryFactory = WireCharacterFactory()

        }
    }
}
