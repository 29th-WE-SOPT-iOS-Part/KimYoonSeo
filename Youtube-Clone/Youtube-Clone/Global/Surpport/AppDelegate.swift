//
//  AppDelegate.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/02.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.navigationController = MainNavigationController(rootViewController: TabBarController())
        self.navigationController?.navigationBar.isHidden = true
        self.window?.backgroundColor = .white
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        return true
    }



}

