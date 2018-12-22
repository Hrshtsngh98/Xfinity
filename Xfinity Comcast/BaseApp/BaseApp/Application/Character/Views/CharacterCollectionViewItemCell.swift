//
//  CharacterCollectionViewItemCell.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit

class CharacterCollectionViewItemCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = 8
            characterImageView.layer.borderWidth = 2
            characterImageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var characterTextLable: UILabel!
    
    func setUp(with data: RelatedTopics) {
        
        do {
            if let urlString = data.firstURL, let url = URL(string: urlString) {
                let imageData = try Data.init(contentsOf: url)
                characterImageView.image = UIImage(data: imageData)
            }
        } catch {
            print("Error parsing image")
        }
        
        if let text = data.text {
            characterTextLable.text = text
        }

    }
    
}
