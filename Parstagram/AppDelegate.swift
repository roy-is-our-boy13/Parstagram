//
//  AppDelegate.swift
//  Parstagram
//
//  Created by Roy Perlman on 3/13/20.
//  Copyright © 2020 Roy Perlman. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        Parse.initialize( with: ParseClientConfiguration(block:
            {
            (configuration: ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "roysparstagram"
                configuration.server = "https://roysparstagram.herokuapp.com/parse"
            })
        )
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
    {
        
    }
}

