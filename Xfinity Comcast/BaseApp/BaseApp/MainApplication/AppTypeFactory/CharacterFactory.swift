//
//  RequestManagerFactory.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

public class CharacterFactory {
    
    private var appType: Constant.AppType
    private var url: String {
        get {
            switch appType {
                case .SimpsonsCharacterViewer:
                    return Constant.ServiceUrls.simpsonsCharacterViewer
                case .TheWireCharacterViewer:
                    return Constant.ServiceUrls.theWireCharacterViewer
            }
        }
    }
    
    public init(appType: Constant.AppType) {
        self.appType = appType
    }
    
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
