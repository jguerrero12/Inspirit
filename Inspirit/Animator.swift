//
//  animator.swift
//  Inspirit
//
//  Created by Jose Guerrero on 3/19/17.
//  Copyright © 2017 Jose Guerrero. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if (isPresenting) {
            let toViewController = transitionContext.viewController(forKey: .to)! as! ProfileViewController
            let fromViewController = transitionContext.viewController(forKey: .from)! as! CardsViewController
            let imageView = UIImageView(frame: fromViewController.draggableImageView.frame)
            imageView.image = #imageLiteral(resourceName: "ryan")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true

            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            containerView.addSubview(imageView)
            
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                imageView.frame = toViewController.imageView.frame
            }) { (finished: Bool) -> Void in
                imageView.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        }
        else {
            let toViewController = transitionContext.viewController(forKey: .to)! as! CardsViewController
            let fromViewController = transitionContext.viewController(forKey: .from)! as! ProfileViewController
            let imageView = UIImageView(frame: fromViewController.imageView.frame)
            imageView.image = #imageLiteral(resourceName: "ryan")
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            containerView.addSubview(imageView)
            
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                imageView.frame = toViewController.draggableImageView.frame
            }) { (finished: Bool) -> Void in
                imageView.removeFromSuperview()
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
        }
        
        
    }
    
    
    
}
