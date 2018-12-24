//
//  CharacterRequestManager.swift
//  CharacterViewerFramework
//
//  Created by Harshit Singh on 12/21/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

class CharacterRequestManager {
    
    class func requestCharacter(urlString: String, completion: @escaping serviceCompletionHandler) {
        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else {
                completion(data!, nil)
            }
        }.resume()

    }
    
}
