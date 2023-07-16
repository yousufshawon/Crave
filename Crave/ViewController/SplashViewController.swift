//
//  ViewController.swift
//  Crave
//
//  Created by Yousuf on 15/7/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet var chefHatImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initView()
    }
    
    
    func initView() {
        //chefHatImageView.rotate(degree: -36.54)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false ) { timer in
            self.loadNextScreen()
        }
    }
    
    func loadNextScreen() {
        NavigationManager.replaceWithUITabBarController(from: self)
    }

}

