//
//  CardsViewController.swift
//  Week 5 Lab
//
//  Created by Corwin Crownover on 3/2/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var cardImageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    var cardSwipeRight: CGFloat!
    var cardSwipeLeft: CGFloat!
    
    var photoTransition: PhotoTransition!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInitialCenter = cardImageView.center
        cardSwipeRight = CGFloat(600)
        cardSwipeLeft = CGFloat(-600)
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // FUNCTIONS
    @IBAction func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        //let velocity = sender.velocityInView(view)
        
        let cardRotationUp = convertValue(cardImageView.center.x, r1Min: 160, r1Max: 320, r2Min: 0, r2Max: 25)
        //let cardRotationDown = convertValue(cardImageView.center.x, r1Min: 0, r1Max: 160, r2Min: 0, r2Max: 335)
        
        if sender.state == .Began {
            print("began pan")
            
            cardInitialCenter = cardImageView.center
        
        } else if sender.state == .Changed {
            print("is panning")
            
            cardImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
            cardImageView.transform = CGAffineTransformMakeDegreeRotation(cardRotationUp)
            
            // rotate image CW and CCW based on finger position
            
        } else if sender.state == .Ended {
            print("finished panning")
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                if self.cardImageView.center.x > 210 {
                    self.cardImageView.center.x = self.cardSwipeRight
                    self.cardImageView.transform = CGAffineTransformMakeDegreeRotation(25)
                } else if self.cardImageView.center.x < 110 {
                    self.cardImageView.center.x = self.cardSwipeLeft
                    self.cardImageView.transform = CGAffineTransformMakeDegreeRotation(335)
                } else {
                    self.cardImageView.center = self.cardInitialCenter
                    self.cardImageView.transform = CGAffineTransformMakeDegreeRotation(0)
                }
            })
            
            delay(1, closure: { () -> () in
                self.cardImageView.center = self.cardInitialCenter
                self.cardImageView.transform = CGAffineTransformMakeDegreeRotation(0)
            })
        }
        
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("ProfileSegue", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let profileViewController = segue.destinationViewController as! ProfileViewController
        profileViewController.profileImage = cardImageView.image
        
        photoTransition = PhotoTransition()
        profileViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        profileViewController.transitioningDelegate = photoTransition
    }
    
    

    

}
