//
//  AuthBaseViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/21.
//

import UIKit

import SnapKit
import Then

enum AuthViewType{
    case login
    case signUp
}

class AuthBaseView: UIView {
    
// MARK: - Public Properties
    public var titleText: String? {
        didSet {
            guard let text = titleText else { return }
            titleLabel.text = text
        }
    }
    
    public let textFieldStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 17
    }
    
    public let nameTextField = GoogleTextField().then {
        $0.placeholderText = "이름을 입력해주세요."
    }
    
    public let emailTextField = GoogleTextField().then {
        $0.placeholderText =  "이메일 또는 휴대전화"
    }
    
    public let passwordTextField = GoogleTextField().then {
        $0.placeholderText =  "비밀번호 입력"
        $0.isSecureTextEntry = true
    }
    
    public let nextButton = GoogleButton(type: .filled).then {
        $0.setTitle("다음", for: .normal)
        $0.isEnabled = false
    }
    
    
    /// Optional
    public lazy var accountButton = GoogleButton(type: .clear).then {
        if viewType != .login {
            $0.isHidden = true
            return
        }
        $0.setTitle("계정 만들기", for: .normal)
    }
    
    public lazy var maskingButton = UIButton().then {
        if viewType != .signUp {
            $0.isHidden = true
            return
        }
       
        $0.tintColor = Const.Color.gray
        $0.setTitle("비밀번호 표시", for: .normal)
        $0.contentHorizontalAlignment = .leading
        $0.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        $0.setTitleColor(Const.Color.black, for: .normal)
        $0.setTitleColor(Const.Color.gray, for: .selected)
        $0.isSelected = false
        
        $0.setImage(UIImage(systemName: "checkmark.square"), for: .normal )
        $0.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected )
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -6, bottom: 0, right: 6)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -6)
        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 6)
    }
    
// MARK: - Private Properties
    private var viewType: AuthViewType?
    
    private let logoImageView = UIImageView().then {
        $0.image = Const.Image.logo
        $0.contentMode = .scaleAspectFit
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }
    
    ///Optional
    private lazy var discriptionLabel = UILabel().then {
        if viewType != .login {
            $0.isHidden = true
            return
        }
        $0.text = """
        Youtube로 이동하여 계속하세요.
        앱 및 Safari에서도 Google 서비스에 로그인됩니다.
        """
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.textColor = Const.Color.black
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    

// MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    convenience init(with type: AuthViewType) {
        self.init(frame: .zero)
        self.viewType = type
        setLayouts()
    }
    
   
// MARK: - Public Functions
    public func isEnabled() -> Bool{
        return !(!nameTextField.hasText || !emailTextField.hasText || !passwordTextField.hasText)
    }
    
    public func removeTextFieldText() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0.text?.removeAll()
        }
        
        nextButton.isEnabled = false
    }
}

// MARK: - Layouts
extension AuthBaseView {
    private func setLayouts(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        addSubviews(logoImageView, titleLabel, textFieldStackView, nextButton, discriptionLabel, accountButton, maskingButton)
        textFieldStackView.addArrangedSubviews(nameTextField, emailTextField, passwordTextField)
    }
    
    private func setConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        discriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(161)
            $0.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints {
            switch viewType {
            case .login:
                $0.width.equalTo(74)
            case .signUp:
                $0.leading.equalToSuperview().inset(22)
            case .none:
                break
            }
            $0.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(64)
        }
        
        accountButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.width.equalTo(74)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(64)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(logoImageView.snp.bottom).offset(175)
        }
        
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0.snp.makeConstraints {
                $0.height.equalTo(48)
            }
        }
        
        maskingButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(22)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(10)
            $0.width.equalTo(120)
            $0.height.equalTo(30)
        }
    }
}
