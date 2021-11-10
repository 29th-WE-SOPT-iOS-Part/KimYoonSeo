//
//  LoginCoordinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func goToSignInViewController(_ loginCoorninator: LoginCoordinator, name: String?)
    func goToSignUpViewController(_ loginCoorninator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var delegate: LoginCoordinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }

    let navigationController = UINavigationController()
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController.setViewControllers([loginVC], animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        self.presenter.present(navigationController, animated: true, completion: nil)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginButtonDidTapped(_ loginViewController: LoginViewController, name: String?) {
        let signInCoordinator = SignInCoordinator(presenter: self.navigationController)
        signInCoordinator.delegate = self
        signInCoordinator.name = name
        signInCoordinator.start()
        self.addChildCoordinator(signInCoordinator)
    }
    
    func signUpButtonDidTapped(_ loginViewController: LoginViewController) {
        let signUpCoordinator = SignUpCoordinator(presenter: self.navigationController)
        signUpCoordinator.delegate = self
        signUpCoordinator.start()
        self.addChildCoordinator(signUpCoordinator)
    }
}

extension LoginCoordinator: SignUpCoordinatorDelegate {
    func goToTabbarController(_ signUpViewController: SignUpCoordinator, name: String?) {
        let signInCoordinator = SignInCoordinator(presenter: self.navigationController)
        signInCoordinator.delegate = self
        signInCoordinator.name = name
        signInCoordinator.start()
        self.addChildCoordinator(signInCoordinator)
    }
}

extension LoginCoordinator: SignInCoordinatorDelegate {
    func goToSignUpViewController(_ signInCoordinator: SignInCoordinator) {
        signInCoordinator.rootViewController.dismiss(animated: true) {
            let loginCoordinator = LoginCoordinator(presenter: self.presenter)
            loginCoordinator.start()
            self.addChildCoordinator(loginCoordinator)
            self.removeChildCoordinator(signInCoordinator)
        }
    }

    func goToTabbarController(_ signInCoordinator: SignInCoordinator) {
        self.navigationController.dismiss(animated: true) {
            self.removeChildCoordinator(signInCoordinator)
        }
        self.presenter.dismiss(animated: true) {
            self.removeChildCoordinator(self)
        }
    }
}
