//
//  GoogleTextField.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

class GoogleTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeTextField()
    }
    
    private func makeTextField() {
        clipsToBounds = true
        borderStyle = .none
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        font = .systemFont(ofSize: 18)
        addLeftPadding(with: 10)
    }
}
