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
    var appCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
//        self.navigationController = MainNavigationController(rootViewController: LoginViewController())
//        self.navigationController?.navigationBar.isHidden = true
//        self.window?.backgroundColor = .white
//        self.window?.rootViewController = self.navigationController
//        self.window?.makeKeyAndVisible()
        return true
    }



}

