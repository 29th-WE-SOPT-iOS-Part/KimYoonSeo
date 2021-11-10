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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "로그인"
        authBaseView.titleText = title
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
            login { [weak self] response in
                guard let `self` = self else {return}
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    self.coordinator?.loginButtonDidTapped(self, name: self.authBaseView.nameTextField.text)
                })
            }
            
        case authBaseView.accountButton:
            coordinator?.signUpButtonDidTapped(self)
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

// MARK: - Network
extension LoginViewController {
    private func login(completion: @escaping(GenericResponse<UserVO>) -> Void){
        guard let email = authBaseView.emailTextField.text else {return}
        guard let password = authBaseView.passwordTextField.text else {return}
        
        UserService.shared.login(email: email, password: password)
            .subscribe { networkResult in
                switch networkResult {
                case .success(let response):
                    dump(response)
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
