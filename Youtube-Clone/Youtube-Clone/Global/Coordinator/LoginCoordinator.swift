//
//  LoginCoordinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func loginCoordinatorRequestedLogin(_ loginCoorninator: LoginCoordinator, name: String?)
    func loginCoordinatorRequestedSignUp(_ loginCoorninator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var delegate: LoginCoordinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        self.presenter.pushViewController(loginVC, animated: true)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func loginButtonDidTapped(_ loginViewController: LoginViewController, name: String?) {
        self.delegate?.loginCoordinatorRequestedLogin(self, name: name)
    }
    
    func signUpButtonDidTapped(_ loginViewController: LoginViewController) {
        self.delegate?.loginCoordinatorRequestedSignUp(self)
    }
    
    
}
