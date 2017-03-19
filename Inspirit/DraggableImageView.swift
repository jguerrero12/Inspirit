//
//  DraggableImageView.swift
//  Inspirit
//
//  Created by Jose Guerrero on 3/18/17.
//  Copyright © 2017 Jose Guerrero. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageViewInitalCenter: CGPoint!
    var panBottomRegion: Bool!
    var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        addSubview(imageView)
        
    }
    
    @IBAction func onProfilePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: contentView)
        
        if sender.state == .began {
            imageViewInitalCenter = imageView.center
            panBottomRegion = sender.location(in: contentView).y < imageView.center.y ? false:true
        }
        else if sender.state == .changed {
            imageView.center = CGPoint(x: imageViewInitalCenter.x+translation.x , y: imageViewInitalCenter.y)
            if panBottomRegion! {
                imageView.transform = transform.rotated(by: -translation.x.degreesToRadians/10)
            }
            else {
                imageView.transform = transform.rotated(by: translation.x.degreesToRadians/10)
            }
            
            
        }
        else if sender.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.imageView.center = CGPoint(x: 700, y: self.imageViewInitalCenter.y)
                    self.imageView.transform.rotated(by: CGFloat(-90.degreesToRadians)/10)
                }, completion: { (Bool) in
                    self.imageView.transform = .identity
                    self.imageView.center = self.imageViewInitalCenter
                })
            }
            else if translation.x < -50 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.imageView.center = CGPoint(x: -400, y: self.imageViewInitalCenter.y)
                    self.imageView.transform.rotated(by: CGFloat(90.degreesToRadians)/10)
                }, completion: { (Bool) in
                    self.imageView.transform = .identity
                    self.imageView.center = self.imageViewInitalCenter
                })
            }
            else {
                imageView.transform = .identity
                imageView.center = imageViewInitalCenter
            }
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
