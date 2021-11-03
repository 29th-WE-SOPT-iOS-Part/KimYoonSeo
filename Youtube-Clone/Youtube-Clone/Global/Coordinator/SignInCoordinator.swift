//
//  SignInCoordinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

protocol SignInCoordinatorDelegate: AnyObject {
    func signInCoordinatorRequestedAccount(_ signInCoordinator: SignInCoordinator)
    func signInCoordinatorRequestedNext(_ signInCoordinator: SignInCoordinator)
}

class SignInCoordinator: BaseCoodinator {
    var rootViewController: UIViewController {
        return self.presenter
    }
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var delegate: SignInCoordinatorDelegate?
    
    var name: String?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let signInVC = SignInViewController()
        signInVC.delegate = self
        signInVC.name = name
        signInVC.modalPresentationStyle = .fullScreen
        self.presenter.present(signInVC, animated: true, completion: nil)
    }
}

extension SignInCoordinator: SignInViewControllerDelegate {
    func accountButtonDidTapped(_ signInViewController: SignInViewController) {
        delegate?.signInCoordinatorRequestedAccount(self)
    }
    
    func nextButtonDidTapped(_ signInViewController: SignInViewController) {
        delegate?.signInCoordinatorRequestedNext(self)
    }
}
