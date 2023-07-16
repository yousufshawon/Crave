//
//  NavigationManager.swift
//  Crave
//
//  Created by Yousuf on 15/7/23.
//

import Foundation
import UIKit

class NavigationManager {
    
    static func replaceWithUITabBarController(from currentViewController : UIViewController) {
        print("Replace with UITabBarController")
        if let tabBarController = currentViewController.storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.MainTabBarControllerStoryboardId) as? UITabBarController {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    sceneDelegate.window?.rootViewController = tabBarController
                }
            }
        }
    }
    
}
