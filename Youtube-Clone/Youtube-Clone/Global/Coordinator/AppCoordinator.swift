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
        self.presenter.isNavigationBarHidden = true
        self.childCoordinators = []
    }

    func start() {
        window.rootViewController = presenter
        let coordinator = LoginCoordinator(presenter: presenter)
        childCoordinators.append(coordinator)
        coordinator.start()
        coordinator.delegate = self
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
            let signUpCoordinator = SignUpCoordinator(presenter: self.presenter)
            signUpCoordinator.delegate = self
            signUpCoordinator.start()
            self.removeChildCoordinator(signInCoordinator)
            self.addChildCoordinator(signUpCoordinator)
        }
       
    }
    
    func goToTabbarController(_ signInCoordinator: SignInCoordinator) {
        let tabBarCoodinator = TabBarCoodinator(presenter: self.presenter)
        tabBarCoodinator.start()
        self.addChildCoordinator(tabBarCoodinator)
        self.removeChildCoordinator(signInCoordinator)
        
    }
}
