//
//  AppDelegate.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let tbc = sb.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tbc
        self.window?.makeKeyAndVisible()
        if let vc = UIApplication.topViewController() as? HomeViewController {
             vc.store = CovidStoreImplementation()
        }
        return true
    }
}
