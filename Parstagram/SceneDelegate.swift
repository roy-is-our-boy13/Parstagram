//
//  SceneDelegate.swift
//  Parstagram
//
//  Created by Roy Perlman on 3/13/20.
//  Copyright © 2020 Roy Perlman. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SceneDelegate: UIResponder, UIWindowSceneDelegate
{
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)
    {
        //Rought draph code.
        guard let windowScene = (scene as? UIWindowScene)
            else
            {
                return
            }
        if PFUser.current() != nil
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.window = UIWindow(windowScene: windowScene)
            
            self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "FeedNavigationController")
            print("window %@", window)
            self.window?.makeKeyAndVisible()
        }
        
        /*guard let _ = (scene as? UIWindowScene)
           
        else
        {
            return
        }*/
    }

    func sceneDidDisconnect(_ scene: UIScene)
    {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene)
    {
    
    }

    func sceneWillResignActive(_ scene: UIScene)
    {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene)
    {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene)
    {
        
    }
}

