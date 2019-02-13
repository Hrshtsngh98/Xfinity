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
    
    //MARK:- IBoutlets
    
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var characterTitleLabel: UILabel! {
        didSet {
            characterTitleLabel.numberOfLines = 0
        }
    }
    
    //method to setup data inside the cell
    func setUp(with data: RelatedTopics) {
        if let urlString = data.icon?.url, let url = URL(string: urlString) {
            characterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: Constant.DefaultStrings.defaultImageName, in: BaseAppBundleHelper.bundle, compatibleWith: nil))
        }
        
        if let array = data.text?.splitByHyphen(), let titleString = array.first {
            let attributedText = NSAttributedString(string: titleString, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
            characterTitleLabel.attributedText = attributedText
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = UIImage(named: Constant.DefaultStrings.defaultImageName, in: BaseAppBundleHelper.bundle, compatibleWith: nil)
        characterTitleLabel.text = nil
    }
    
}
