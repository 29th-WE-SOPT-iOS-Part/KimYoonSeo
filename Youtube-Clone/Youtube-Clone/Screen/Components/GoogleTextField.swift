//
//  GoogleTextField.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

class GoogleTextField: UITextField {
    
// MARK: - Public Properties
    public var placeholderText: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(string: placeholderText ?? "", attributes: [.foregroundColor : Const.Color.gray, .font: UIFont.systemFont(ofSize: 15, weight: .regular)])
        }
    }
    
// MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

// MARK: - make TextField
    private func makeTextField() {
        clipsToBounds = true
        borderStyle = .none
        layer.cornerRadius = 10
        layer.borderColor = Const.Color.lightGray.cgColor
        layer.borderWidth = 1
        font = .systemFont(ofSize: 15)
        addLeftPadding(with: 10)
    }
}
