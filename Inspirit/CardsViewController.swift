//
//  ViewController.swift
//  Inspirit
//
//  Created by Jose Guerrero on 3/18/17.
//  Copyright © 2017 Jose Guerrero. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    let transition = Animator()
    @IBOutlet weak var draggableImageView: DraggableImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        draggableImageView.imageView.image = UIImage(named: "ryan")
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            transition.isPresenting = true
            return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    
    @IBAction func onProfileTap(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        vc.image = draggableImageView.image
        //vc.modalPresentationStyle = UIModalPresentationStyle.custom
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

