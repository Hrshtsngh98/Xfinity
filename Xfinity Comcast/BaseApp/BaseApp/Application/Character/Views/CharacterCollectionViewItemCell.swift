//
//  CharacterCollectionViewItemCell.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterCollectionViewItemCell: UICollectionViewCell {
    
    private let defaultImageName = "default_image"
    
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.layer.cornerRadius = 8
            characterImageView.layer.borderWidth = 2
            characterImageView.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var characterTextLable: UILabel!
    
    func setUp(with data: RelatedTopics) {
        if let urlString = data.icon?.url, let url = URL(string: urlString) {
            characterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: defaultImageName, in: BaseAppBundleHelper.bundle, compatibleWith: nil))
        }
        
        if let text = data.text {
            characterTextLable.text = text
        }

    }
    
}
