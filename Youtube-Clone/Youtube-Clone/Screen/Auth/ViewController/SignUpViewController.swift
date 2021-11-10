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
        title = "회원가입"
        authBaseView.titleText = title
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
            requestSignUp {[weak self] response in
                guard let `self` = self else {return}
                self.makeAlert(title: "회원가입", message: response.message, okAction: { _ in
                    guard let user = response.data else {return}
                    self.coordinator?.signUpButtonDidTapped(self, name: user.name)
                })
            }
            
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

// MARK: - Network
extension SignUpViewController {
    private func requestSignUp(completion: @escaping(GenericResponse<UserVO>) -> Void){
        guard let email = authBaseView.emailTextField.text else {return}
        guard let password = authBaseView.passwordTextField.text else {return}
        guard let name = authBaseView.nameTextField.text else {return}
        
        UserService.shared.signUp(email: email, password: password, name: name)
            .subscribe { networkResult in
                switch networkResult {
                case .success(let response):
                    if let response = response as? GenericResponse<UserVO> {
                        completion(response)
                    }
                case .requestErr(let message):
                    print("requestErr", message)
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
            
                }
            } onError: { err in
                print("err")
            }
            .disposed(by: disposeBag)
    }
}
