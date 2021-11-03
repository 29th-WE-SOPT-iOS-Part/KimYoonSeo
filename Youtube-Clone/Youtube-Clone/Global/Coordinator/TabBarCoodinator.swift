//
//  TabBarCoodinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

class TabBarCoodinator: BaseCoodinator {
    var rootViewController: UIViewController {
        return self.presenter
    }
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let tabBarController = TabBarController()
        self.presenter = MainNavigationController(rootViewController: tabBarController)
        UIApplication.shared.windows.first?.rootViewController = presenter
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
