//
//  SignInViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/02.
//

import UIKit

import SnapKit
import Then

class LoginViewController: BaseViewController {

// MARK: - Private Properties
    private let authBaseView = AuthBaseView(with: .login)

// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        authBaseView.titleText = "로그인"
        setTargets()
        setLayouts()
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
            let vc = WelcomeViewController()
            vc.name = authBaseView.nameTextField.text
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        case authBaseView.accountButton:
            navigationController?.pushViewController(SignUpViewController(), animated: true)
        default:
            break
        }
       
    }
}

// MARK: - Layout
extension LoginViewController {
    private func setLayouts() {
        setViewHiearachy()
        setConstraints()
    }
    
    private func setViewHiearachy() {
        view.addSubviews(authBaseView)
    }
    
    private func setConstraints() {
        authBaseView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
