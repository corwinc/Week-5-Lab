//
//  ProfileViewController.swift
//  Week 5 Lab
//
//  Created by Corwin Crownover on 3/2/16.
//  Copyright © 2016 Corwin Crownover. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    
    var profileImage: UIImage!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = profileImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // FUNCTIONS
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
