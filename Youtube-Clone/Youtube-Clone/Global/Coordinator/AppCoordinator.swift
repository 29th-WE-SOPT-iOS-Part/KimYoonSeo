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

extension AppCoordinator: LoginCoordinatorDelegate {
    func goToSignInViewController(_ loginCoorninator: LoginCoordinator, name: String?) {
        let signInCoordinator = SignInCoordinator(presenter: self.presenter)
        signInCoordinator.delegate = self
        signInCoordinator.name = name
        signInCoordinator.start()
        self.addChildCoordinator(signInCoordinator)
    }
    
    func goToSignUpViewController(_ loginCoorninator: LoginCoordinator) {
        let signUpCoordinator = SignUpCoordinator(presenter: self.presenter)
        signUpCoordinator.delegate = self
        signUpCoordinator.start()
        self.addChildCoordinator(signUpCoordinator)
    }
    
}

extension AppCoordinator: SignUpCoordinatorDelegate {
    func goToTabbarController(_ signUpViewController: SignUpCoordinator, name: String?) {
        let signInCoordinator = SignInCoordinator(presenter: self.presenter)
        signInCoordinator.delegate = self
        signInCoordinator.name = name
        signInCoordinator.start()
        self.addChildCoordinator(signInCoordinator)
    }
}

extension AppCoordinator: SignInCoordinatorDelegate {
    func goToSignUpViewController(_ signInCoordinator: SignInCoordinator) {
        signInCoordinator.rootViewController.dismiss(animated: true) {
            let loginCoordinator = LoginCoordinator(presenter: self.presenter)
            loginCoordinator.delegate = self
            loginCoordinator.start()
            self.addChildCoordinator(loginCoordinator)
            self.removeChildCoordinator(signInCoordinator)
        }
    }
    
    func goToTabbarController(_ signInCoordinator: SignInCoordinator) {
        self.start()
    }
}

extension AppCoordinator: TabBarCoodinatorDelegate {
    func goToLoginViewController(_ coordinator: TabBarCoodinator) {
        self.removeChildCoordinator(coordinator)
        let loginCoordinator = LoginCoordinator(presenter: self.presenter)
        loginCoordinator.start()
        loginCoordinator.delegate = self
        self.addChildCoordinator(loginCoordinator)
    }
}
