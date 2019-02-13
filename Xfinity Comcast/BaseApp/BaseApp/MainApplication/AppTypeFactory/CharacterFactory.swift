//
//  RequestManagerFactory.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

protocol CharacterFactory {
    var appType: Constant.AppType { get }
    var url: String {get}
    func getData(completion: @escaping completionForCharacterModel)
}

extension CharacterFactory {
    
    //Method to make service call from request manager
    public func getData(completion: @escaping completionForCharacterModel) {
        
        CharacterRequestManager.requestCharacter(urlString: url) { (data, error) in
            if error == nil {
                guard let data = data else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let characterModel = try decoder.decode(CharacterModel.self, from: data)
                    completion(characterModel, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
}
