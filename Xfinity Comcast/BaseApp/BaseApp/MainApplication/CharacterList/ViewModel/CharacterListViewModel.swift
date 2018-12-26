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
    
    //Method to get the data from app-type respective factory which in turn makes the service call from request manager.
    func getData(completion: @escaping completionForCharacterModel) {
        characterFactory.getData { (model, error) in
            if error == nil {
                self.relatedTopics = model!.relatedTopics!
                self.backUpList = self.relatedTopics
            }
            completion(model, error)
        }
    }
    
    //Method to filter the character list based on the search string user inputs
    func filterCharacterList(searchText: String, completion: @escaping completionHandler) {
        relatedTopics = backUpList
        if searchText.count != 0 {
            relatedTopics = relatedTopics.filter({$0.text?.contains(searchText) ?? false})
        }
        completion()
    }
}
