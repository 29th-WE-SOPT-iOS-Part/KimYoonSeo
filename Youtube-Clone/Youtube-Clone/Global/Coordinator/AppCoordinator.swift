//
//  AppCoordinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

final class AppCoordinator: Coordinator{
    
    var presenter: UINavigationController
    var childCoordinators: [Coordinator]

    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.window.backgroundColor = .white
        self.presenter = UINavigationController()
        self.childCoordinators = []
    }

    func start() {
        let coordinator = TabBarCoodinator(presenter: presenter)
        coordinator.delegate = self
        self.presenter = MainNavigationController(rootViewController: coordinator.makeTabBar())
        window.rootViewController = presenter
        childCoordinators.append(coordinator)
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator: TabBarCoodinatorDelegate {
    func goToLoginViewController(_ coordinator: TabBarCoodinator) {
        let loginCoordinator = LoginCoordinator(presenter: self.presenter)
        loginCoordinator.start()
        self.addChildCoordinator(loginCoordinator)
    }
}
