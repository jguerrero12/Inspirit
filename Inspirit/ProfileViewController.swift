//
//  ProfileViewController.swift
//  Inspirit
//
//  Created by Jose Guerrero on 3/18/17.
//  Copyright © 2017 Jose Guerrero. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    var image: UIImage!
    var animator = Animator()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapNavBar(_ sender: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
