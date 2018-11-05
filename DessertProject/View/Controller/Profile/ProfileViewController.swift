//
//  ProfileViewController.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 4/11/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//


import UIKit
import Lottie

class ProfileViewController: UIViewController{
    
    
    @IBOutlet weak var container: UIView!
    
    
    override func viewDidLoad() {
        startAnimation()
    }
    func startAnimation(){
        let animationView = LOTAnimationView(name: "loading_animation")
        animationView.frame = self.container.frame
        self.container.addSubview(animationView)
        animationView.play()
        
    }
}


