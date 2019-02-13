//
//  CharacterCollectionViewRowCell.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit

class CharacterCollectionViewRowCell: UICollectionViewCell {
    
     //MARK:- IBoutlets
    
    @IBOutlet weak var characterTitleLabel: UILabel!
    
    //method to setup data inside the cell
    func setUp(with data: RelatedTopics) {
        if let array = data.text?.splitByHyphen(), let titleString = array.first {
            let attributedText = NSAttributedString(string: titleString, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
            characterTitleLabel.attributedText = attributedText
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterTitleLabel.text = nil
    }
}
