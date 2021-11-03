//
//  SignUpViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

import SnapKit
import Then

protocol SignUpViewControllerDelegate: AnyObject {
    func signUpButtonDidTapped(_ signUpViewController: SignUpViewController, name: String?)
}

class SignUpViewController: BaseViewController {
// MARK: - Public Properties
    weak var coordinator: SignUpViewControllerDelegate?
    
// MARK: - Private Properties
    private let authBaseView = AuthBaseView(with: .signUp)

// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        authBaseView.titleText = "회원가입"
        setLayouts()
        hideNavigationBar()
        setTargets()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        authBaseView.removeTextFieldText()
    }
    
// MARK: - Private Functions
    private func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setTargets() {
        [authBaseView.maskingButton,
         authBaseView.nextButton].forEach {
            $0.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside )
        }
        
        [authBaseView.nameTextField,
         authBaseView.emailTextField,
         authBaseView.passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }

}

// MARK: - @objc Functions
extension SignUpViewController {
    @objc
    private func textFieldDidChange(_ textField : UITextField){
        authBaseView.nextButton.isEnabled = authBaseView.isEnabled()
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        switch sender {
        case authBaseView.nextButton:
            coordinator?.signUpButtonDidTapped(self, name: authBaseView.nameTextField.text)
            
        case authBaseView.maskingButton:
            authBaseView.passwordTextField.isSecureTextEntry.toggle()
            authBaseView.maskingButton.isSelected.toggle()
        default:
            break
        }
    }
    
}

// MARK: - Layout
extension SignUpViewController {
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
