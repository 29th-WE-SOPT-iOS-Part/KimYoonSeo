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
        self.navigationController = UINavigationController(rootViewController: LoginViewController())
        self.navigationController?.navigationBar.isHidden = true
        self.window?.rootViewController = self.navigationController
        self.window?.makeKeyAndVisible()
        return true
    }



}

