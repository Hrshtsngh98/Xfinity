//
//  CharacterCollectionViewRowCell.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit

class CharacterCollectionViewRowCell: UICollectionViewCell {
    
    @IBOutlet weak var characterTextLabel: UILabel!
    
    func setUp(with data: RelatedTopics) {
        
        if let text = data.text {
            characterTextLabel.text = text
        }
        
    }
    
}
