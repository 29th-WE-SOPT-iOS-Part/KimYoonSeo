//
//  SignInViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

import SnapKit
import Then

protocol SignInViewControllerDelegate: AnyObject {
    func accountButtonDidTapped(_ signInViewController: SignInViewController)
    func nextButtonDidTapped(_ signInViewController: SignInViewController)
}

class SignInViewController: BaseViewController {
// MARK: - Public Properties
    public var name: String? {
        didSet {
            guard let name = name else { return }
            welcomeLabel.text = """
            \(String(describing: name))님
            환영합니다
            """
        }
    }
    
    public weak var delegate: SignInViewControllerDelegate?

// MARK: - Private Properties
    private let welcomeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 26, weight: .semibold)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private let nextButton = GoogleButton(type: .filled).then {
        $0.setTitle("확인", for: .normal)
    }
    
    private let logoImageView = UIImageView().then {
        $0.image = Const.Image.logo
        $0.contentMode = .scaleAspectFit
    }
    
    private let accountButton = GoogleButton(type: .clear).then {
        $0.setTitle("다른 계정으로 로그인하기", for: .normal)
    }

// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        setTargets()
    }
    
    
    private func setTargets() {
        [nextButton, accountButton].forEach{
            $0.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside )
        }
    }

}

// MARK: - @objc Function
extension SignInViewController {
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        switch sender {
        case nextButton:
            delegate?.nextButtonDidTapped(self)

        case accountButton:
            delegate?.accountButtonDidTapped(self)
            
        default:
            break
        }
    }
}

// MARK: - Layout
extension SignInViewController {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(logoImageView, welcomeLabel, nextButton, accountButton)
    }
    
    private func setConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(198)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(53)
        }
        
        accountButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(nextButton.snp.bottom).offset(17)
        }
    }
}

