//
//  SignInViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/02.
//

import UIKit

import SnapKit
import Then

protocol LoginViewControllerDelegate: AnyObject {
    func loginButtonDidTapped(_ loginViewController: LoginViewController, name: String?)
    func signUpButtonDidTapped(_ loginViewController: LoginViewController)
}

class LoginViewController: BaseViewController {
// MARK: - Public Properties
    public weak var coordinator: LoginViewControllerDelegate?

// MARK: - Private Properties
    private let authBaseView = AuthBaseView(with: .login)

// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        authBaseView.titleText = "로그인"
        setTargets()
        setLayouts()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        authBaseView.removeTextFieldText()
    }

// MARK: - Functions
    private func setTargets() {
        [authBaseView.nextButton,
         authBaseView.accountButton].forEach {
            $0.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside )
        }
        
        [authBaseView.nameTextField,
         authBaseView.emailTextField,
         authBaseView.passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
}

// MARK: - @objc Funtions
extension LoginViewController {
    @objc
    private func textFieldDidChange(_ textField : UITextField){
        authBaseView.nextButton.isEnabled = authBaseView.isEnabled()
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        switch sender {
        case authBaseView.nextButton:
            coordinator?.loginButtonDidTapped(self, name: authBaseView.nameTextField.text)
//            let vc = SignInViewController()
//            vc.name = authBaseView.nameTextField.text
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)
        case authBaseView.accountButton:
            coordinator?.signUpButtonDidTapped(self)
//            navigationController?.present(SignUpViewController(), animated: true)
        default:
            break
        }
       
    }
}

// MARK: - Layout
extension LoginViewController {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(authBaseView)
    }
    
    private func setConstraints() {
        authBaseView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
