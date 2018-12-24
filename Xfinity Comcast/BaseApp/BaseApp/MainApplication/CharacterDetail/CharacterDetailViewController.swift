//
//  CharacterDetailViewController.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/23/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import UIKit
import SDWebImage

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterDetailText: UILabel! {
        didSet {
            characterDetailText.text = Constant.DefaultStrings.characterDetailString
        }
    }
    
    var relatedTopic: RelatedTopics?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constant.DefaultStrings.characterDetailTitleString
        setUpData()
    }
    
    func setUpData() {
        guard let topic = relatedTopic, let text = topic.text else {
            return
        }
        characterDetailText.text = text
        if let urlString = topic.icon?.url, let url = URL(string: urlString) {
            characterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: Constant.DefaultStrings.defaultImageName, in: BaseAppBundleHelper.bundle, compatibleWith: nil))
        }
        
        let array = text.splitByHypen()
        if array.count > 0 {
            self.title = array[0]
        }
        
        if array.count > 1 {
          characterDetailText.text = array[1]
        }
        
    }
}
