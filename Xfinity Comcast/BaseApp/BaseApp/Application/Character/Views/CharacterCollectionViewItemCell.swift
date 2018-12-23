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
    
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var characterTextLable: UILabel!
    @IBOutlet weak var characterTitleLabel: UILabel!
    
    func setUp(with data: RelatedTopics) {
        if let urlString = data.icon?.url, let url = URL(string: urlString) {
            characterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: Constant.Strings.defaultImageName, in: BaseAppBundleHelper.bundle, compatibleWith: nil))
        }
        
        if let array = data.text?.splitByHypen() {
            if array.count > 0 {
                let attributedText = NSAttributedString(string: array[0], attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
                characterTitleLabel.attributedText = attributedText
            }
            
            if array.count > 1 {
                characterTextLable.text = array[1]
            }
        }
    }
    
}
