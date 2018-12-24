//
//  UIViewController+Alert.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

extension UIViewController {
    
    public func showErrorAlert(title: String, message: String?, alertActions: [UIAlertAction]?) {
        let alterController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alterController.addAction(UIAlertAction.init(title: Constant.DefaultStrings.ok, style: .default, handler: nil))
        
        if let actions = alertActions, actions.count != 0 {
            for action in actions {
                alterController.addAction(action)
            }
        }
        
        present(alterController, animated: true, completion: nil)
    }
    
}
