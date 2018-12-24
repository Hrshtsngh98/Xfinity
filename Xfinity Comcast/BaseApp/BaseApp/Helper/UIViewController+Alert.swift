//
//  UIViewController+Alert.swift
//  BaseApp
//
//  Created by Harshit Singh on 12/22/18.
//  Copyright © 2018 Harshit Singh. All rights reserved.
//

import Foundation

extension UIViewController {
    
    public func showErrorAlert(error: Error, alertActions: [UIAlertAction]?) {
        let alterController = UIAlertController.init(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alterController.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
        
        if let actions = alertActions, actions.count != 0 {
            for action in actions {
                alterController.addAction(action)
            }
        }
        
        present(alterController, animated: true, completion: nil)
    }
    
}
