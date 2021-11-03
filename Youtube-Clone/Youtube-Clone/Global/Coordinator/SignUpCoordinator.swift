//
//  SignUpCoordinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

protocol SignUpCoordinatorDelegate: AnyObject {
    func signUpCoordinatorRequestedSignUp(_ signUpViewController: SignUpCoordinator, name: String?)
}

class SignUpCoordinator: Coordinator {
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var delegate: SignUpCoordinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let signUpVC = SignUpViewController()
        signUpVC.coordinator = self
        self.presenter.pushViewController(signUpVC, animated: true)
    }
}

extension SignUpCoordinator: SignUpViewControllerDelegate {
    func signUpButtonDidTapped(_ signUpViewController: SignUpViewController, name: String?) {
        delegate?.signUpCoordinatorRequestedSignUp(self, name: name)
    }
}
