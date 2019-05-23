//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Hayden Hastings on 5/23/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    var sourceCell: FriendsTableViewCell?
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return nil
    }
}
