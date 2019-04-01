//
//  AppDelegate.swift
//  CoinMarket
//
//  Created by Toof_Appsia on 3/14/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.setupWindow()
        
        return true
    }
    
    private func setupWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = DashboardViewController.initFromNIB()
        self.window?.makeKeyAndVisible()
    }

}

