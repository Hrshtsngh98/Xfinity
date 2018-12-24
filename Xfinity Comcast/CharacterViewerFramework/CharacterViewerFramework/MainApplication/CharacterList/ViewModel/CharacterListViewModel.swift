//
//  CharacterListViewModel.swift
//  CharacterViewerFramework
//
//  Created by Harshit Singh on 12/23/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    var characterFactory: CharacterFactory
    var titleString: String
    var relatedTopics: [RelatedTopics] = []
    var backUpList: [RelatedTopics] = []
    
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
    
    func getData(completion: @escaping completionForCharacterModel) {
        characterFactory.getData { (model, error) in
            if error == nil {
                self.relatedTopics = model!.relatedTopics!
                self.backUpList = self.relatedTopics
            }
            completion(model, error)
        }
    }
    
    
    func filterCharacterList(searchText: String, completion: @escaping completionHandler) {
        relatedTopics = backUpList
        if searchText.count != 0 {
            relatedTopics = relatedTopics.filter({$0.text?.contains(searchText) ?? false})
        }
        completion()
    }
}
