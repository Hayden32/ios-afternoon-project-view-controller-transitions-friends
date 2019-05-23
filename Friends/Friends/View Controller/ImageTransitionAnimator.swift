//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Hayden Hastings on 5/23/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromTVC = transitionContext.viewController(forKey: .from) as? FriendsTableViewCell,
        let toVC = transitionContext.viewController(forKey: .to) as? FriendsDetailViewController,
            let toView = transitionContext.view(forKey: .to) else { return }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toView)
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        
        let fromImage = fromTVC.photoImageView!
        let toImage = toVC.photoImageView!
        
        let fromLabel = fromTVC.nameLabel!
        let toLabel = toVC.nameLabel!
        
        toView.layoutIfNeeded()
        
        let transitionalImageFrame = containerView.convert(fromImage.bounds, from: fromImage)
        let transitionalImageEndFrame = containerView.convert(toImage.bounds, from: toImage)
        
        let transitionalLabelFrame = containerView.convert(fromLabel.bounds, from: fromLabel)
        let transitionalLabelEndFrame = containerView.convert(toLabel.bounds, from: toLabel)
        
        let transitionalImage = UIImageView(frame: transitionalImageFrame)
        let transitionalLabel = UILabel(frame: transitionalLabelFrame)
        
        transitionalLabel.text = fromLabel.text
        transitionalLabel.font = fromLabel.font
        transitionalLabel.textColor = fromLabel.textColor
        
        transitionalImage.image = fromImage.image
        
        containerView.addSubview(transitionalImage)
        containerView.addSubview(transitionalLabel)
        
        let animationDuration = self.transitionDuration(using: transitionContext)
        
        toLabel.alpha = 0
        fromLabel.alpha = 0
        
        UIView.animate(withDuration: animationDuration, animations: {
            
            transitionalLabel.frame = transitionalLabelEndFrame
            transitionalLabel.textColor = toLabel.textColor
            
            transitionalImage.frame = transitionalImageEndFrame
            
        }) { (_) in
            
            transitionalLabel.removeFromSuperview()
            
            toLabel.alpha = 1
            fromLabel.alpha = 1
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
