//
//  CharacterCollectionViewRowCell.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit

class CharacterCollectionViewRowCell: UICollectionViewCell {
    
    @IBOutlet weak var characterTitleLabel: UILabel!
    
    func setUp(with data: RelatedTopics) {
        if let array = data.text?.splitByHypen() {
            if array.count > 0 {
                let attributedText = NSAttributedString(string: array[0], attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
                characterTitleLabel.attributedText = attributedText
            }
        }
        
    }
    
}
