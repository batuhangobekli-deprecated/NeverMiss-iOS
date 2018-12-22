//
//  AppDelegate.swift
//  NeverMiss-iOS
//
//  Created by Batuhan Göbekli on 12/22/18.
//  Copyright © 2018 Batuhan Göbekli. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let accessToken: String? = KeychainWrapper.standard.string(forKey: "token")


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if self.accessToken != nil
        {
           navigateToMainPage()
        }
        return true
    }
    func logout(){
        let deletionSuccess:Bool = KeychainWrapper.standard.removeObject(forKey: "token")
        if deletionSuccess  {
            // User navigate to login screen
            let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginPage = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.window!.rootViewController = loginPage
        }
    }

    func navigateToMainPage()  {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homePage = mainStoryboard.instantiateViewController(withIdentifier: "MainNavController")
        self.window?.rootViewController = homePage
      }
    }


